#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <errno.h>
 
#define KEYVALLEN 100
 
/*   删除左边的空格   */
char * l_trim(char * szOutput, const char *szInput)
{
 assert(szInput != NULL);
 assert(szOutput != NULL);
 assert(szOutput != szInput);
 for   (NULL; *szInput != '\0' && isspace(*szInput); ++szInput){
  ;
 }
 return strcpy(szOutput, szInput);
}
 
/*   删除右边的空格   */
char *r_trim(char *szOutput, const char *szInput)
{
 char *p = NULL;
 assert(szInput != NULL);
 assert(szOutput != NULL);
 assert(szOutput != szInput);
 strcpy(szOutput, szInput);
 for(p = szOutput + strlen(szOutput) - 1; p >= szOutput && isspace(*p); --p){
  ;
 }
 *(++p) = '\0';
 return szOutput;
}
 
/*   删除两边的空格   */
char * a_trim(char * szOutput, const char * szInput)
{
 char *p = NULL;
 assert(szInput != NULL);
 assert(szOutput != NULL);
 l_trim(szOutput, szInput);
 for   (p = szOutput + strlen(szOutput) - 1;p >= szOutput && isspace(*p); --p){
  ;
 }
 *(++p) = '\0';
 return szOutput;
}
 
 
int GetProfileString(char *profile, char *AppName, char *KeyName, char *KeyVal )
{
 char appname[32],keyname[32];
 char *buf,*c;
 char buf_i[KEYVALLEN], buf_o[KEYVALLEN];
 FILE *fp;
 int found=0; /* 1 AppName 2 KeyName */
 if( (fp=fopen( profile,"r" ))==NULL ){
  printf( "openfile [%s] error [%s]\n",profile,strerror(errno) );
  return(-1);
 }
 fseek( fp, 0, SEEK_SET );
 memset( appname, 0, sizeof(appname) );
 sprintf( appname,"[%s]", AppName );
 
 while( !feof(fp) && fgets( buf_i, KEYVALLEN, fp )!=NULL ){
  l_trim(buf_o, buf_i);
  if( strlen(buf_o) <= 0 )
   continue;
  buf = NULL;
  buf = buf_o;
 
  if( found == 0 ){
   if( buf[0] != '[' ) {
    continue;
   } else if ( strncmp(buf,appname,strlen(appname))==0 ){
    found = 1;
    continue;
   }
 
  } else if( found == 1 ){
   if( buf[0] == '#' ){
    continue;
   } else if ( buf[0] == '[' ) {
    break;
   } else {
    if( (c = (char*)strchr(buf, '=')) == NULL )
     continue;
    memset( keyname, 0, sizeof(keyname) );
 
   sscanf( buf, "%[^=|^ |^\t]", keyname );
    if( strcmp(keyname, KeyName) == 0 ){
     sscanf( ++c, "%[^\n]", KeyVal );
     char *KeyVal_o = (char *)malloc(strlen(KeyVal) + 1);
     if(KeyVal_o != NULL){
      memset(KeyVal_o, 0, sizeof(KeyVal_o));
      a_trim(KeyVal_o, KeyVal);
      if(KeyVal_o && strlen(KeyVal_o) > 0)
       strcpy(KeyVal, KeyVal_o);
      free(KeyVal_o);
      KeyVal_o = NULL;
     }
     found = 2;
     break;
    } else {
     continue;
    }
   }
  }
 }
 fclose( fp );
 if( found == 2 )
  return(0);
 else
  return(-1);
}
 
void main()
{
        char ip[16];
	char mac[32];
	char id[10],num[10];
        GetProfileString("./cls.conf", "cls_server", "ip", ip);
        printf("%s\n",ip);
        GetProfileString("./cls.conf", "server", "ip", ip);
        printf("%s\n",ip);

        GetProfileString("./cls.conf", "server", "mac", mac);
        printf("%s\n",mac);

        GetProfileString("./cls.conf", "port", "id", id);
        printf("%s\n",id);

        GetProfileString("./cls.conf", "port", "num", num);
        printf("%s\n",num);
}
