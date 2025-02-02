{*
 * File: ...................... Socks4Proxy.pas
 * Autor: ..................... Maxim Artemev aka Bert Raccoon
 * Copyright: ................. (c) 2004 by Max Artemev, MC NTT (www.ntt.ru)
 * Desc: ...................... HTTP client side proxy implementation
                                according to RFC2817
 $Id: HTTPProxy.pas,v 1.2 2005/02/15 11:21:21 bert Exp $

 $Log: HTTPProxy.pas,v $
 Revision 1.2  2005/02/15 11:21:21  bert
 *** empty log message ***

}
unit HTTPProxy;

interface
uses Windows, Messages, Classes, SysUtils,
     winsock2, loger, misc, cfg, base64, AbstractProxy;

type
    THTTPProxy = class(TAbstractProxy)
    public
      function connect(DestAddr: TSockAddr): integer; override;
    end;

implementation

{ THTTPProxy }

function THTTPProxy.connect(DestAddr: TSockAddr): integer;
var
   Buf: array [0..1023] of char;
   s  : string;
   res: integer;
   code: integer;
begin
     inherited connect(DestAddr);
     Log(LOG_LEVEL_SOCKS, 'Using HTTP proxy at %s:%d.', [FHost, FPort]);

     result := -1;

     s := Format('CONNECT %s:%d HTTP/1.1'#13#10,[DestAddrHost, ntohs(FDestAddr.sin_port)]);
     s := s + Format('Host: %s:%d'#13#10, [DestAddrHost, ntohs(FDestAddr.sin_port)]);
     if (FLogin <> '') then
     begin
          s := s + Format('Proxy-Authorization: Basic %s'#13#10,[MimeEncodeString(FLogin + ':' + FPassword)]);
     end;
     s := s + #13#10;

     Log(LOG_LEVEL_SOCKS, 'Attempt to connect via HTTP proxy to %s:%d ...', [DestAddrHost, ntohs(FDestAddr.sin_port)]);


     SendData(@s[1], Length(s));
     Log(LOG_LEVEL_SOCKS, 'Sending request to HTTP proxy',[]);
     res := RecvData(@Buf, SizeOf(Buf));

     if res <= 0 then
        exit;

     s := copy(buf, 0, res);
     Delete(s, pos(#13#10, s), MaxInt);

     Log(LOG_LEVEL_SOCKS, 'Response from HTTP proxy is "%s"',[s]);


     Delete(s, 1, pos(' ', s));
     Delete(s, pos(' ', s), MaxInt);
     code := StrToInt(s);

     if (code >= 200) and (code < 300) then
     begin
          Log(LOG_LEVEL_SOCKS, 'Interpreted as OK',[]);
          result := 0;
     end
     else
     begin
          Log(LOG_LEVEL_SOCKS, 'Interpreted as error',[]);
          Log(LOG_LEVEL_SOCKS, 'Response from HTTP proxy was:'#13#10'%s', [Buf]);
          exit;
     end;
end;

end.
