#include <dnet.h>
/*
=======================================================================================================================
Libdnet头文件 ;
下面是定义的回调函数，它实现了显示防火墙规则的功能
=======================================================================================================================
 */
int show_firewall_fules(const struct fw_rule *firewall_rule, void *parameter)
{
    char operation[100];
    /* 操作，表示是禁止还是允许 */
    char direction[100];
    /* 方向，表示是进入还是出去 */
    char net_interface[100];
    /* 网络接口 */
    char source_ip[100];
    /* 源IP地址 */
    char destination_ip[100];
    /* 目的IP地址 */
    char protocol[16];
    /* 规则协议类型，在此只分析TCP协议和UDP协议 */
    char source_port[16];
    /* 源端口号 */
    char destination_port[16];
    /* 目的端口号 */
    static int count = 1;
    /* 规则个数 */
    operation[0] = '\0';
    direction[0] = '\0';
    net_interface[0] = '\0';
    source_ip[0] = '\0';
    destination_ip[0] = '\0';
    source_port[0] = '\0';
    destination_port[0] = '\0';
    if (firewall_rule->fw_proto == 0)
        protocol[0] = '\0';
    else
    {
        if (firewall_rule->fw_proto == 6)
         /* 表示协议是TCP协议 */
            sprintf(protocol, "%s ", "tcp");
        if (firewall_rule->fw_proto == 17)
         /* 表示协议是UDP协议 */
            sprintf(protocol, "%s ", "udp");
    }
    if (firewall_rule->fw_proto == 6 || firewall_rule->fw_proto == 17)
    {
        /* 求源端口号 */
        if (firewall_rule->fw_sport[0] == firewall_rule->fw_sport[1])
        /* 表示端口号只有一个值 */
        {
            sprintf(source_port, "port = %d", firewall_rule->fw_sport[0]);
        }
        else
        /* 表示端口号是一个范围，例如从1025到65535 */
            sprintf(source_port, "port %d-%d", firewall_rule->fw_sport[0], firewall_rule->fw_sport[1]);
        /* 求目的端口号 */
        if (firewall_rule->fw_dport[0] == firewall_rule->fw_dport[1])
        {
            sprintf(destination_port, "port = %d", firewall_rule->fw_dport[0]);
        }
        else
            sprintf(destination_port, "port %d-%d", firewall_rule->fw_dport[0], firewall_rule->fw_dport[1]);
    }
    if (firewall_rule->fw_op == FW_OP_ALLOW)
     /* 判断操作类型 */
        sprintf(operation, "%s", "pass");
    /* 操作类型是允许 */
    else
        sprintf(operation, "%s", "block");
     / � � � � � � � � � � � � � � * / if (firewall_rule->fw_dir == FW_DIR_IN)
         /* 判断方向 */sprintf(direction, "%s", "in");
    /* 表示进入 */
    else
        strcpy(direction, "out");
    /* 表示出去 */
    sprintf(net_interface, "%s", firewall_rule->fw_device);
    /* 获得网络接口 */
    if (firewall_rule->fw_src.addr_type)
        sprintf(source_ip, "from %s", addr_ntoa(&firewall_rule->fw_src));
    /* 获得源IP地址 */
    else
        sprintf(source_ip, "%s", "");
    if (firewall_rule->fw_dst.addr_type)
        sprintf(destination_ip, "to %s", addr_ntoa(&firewall_rule->fw_dst));
    /* 获得目的IP地址 */
    else
        sprintf(destination_ip, "");
    printf("第%d条规则：\n", count);
    printf("%s %s %s %s %s %s %s %s %s \n", operation,  /* 操作类型 */
    direction,  /* 方向 */
    net_interface,  /* 网络接口 */
    protocol,  /* 协议类型 */
    source_ip,  /* 源IP地址 */
    source_port,  /* 源端口号 */
    destination_ip,  /* 目的IP地址 */
    destination_port,  /* 目的端口号 */
    "");
    /* 输出一个规则 */
    count++;
    /* 规则个数加1 */
    return (0);
}
void main()
{
    struct fw_rule *firewall_rule;
    /* 定义防火墙规则变量 */
    fw_t *firewall_handle;
    /* 定义防火墙句柄 */
    if ((firewall_handle = fw_open()) == NULL)
     /* 打开防火墙操作 */
        printf("打开防火墙错误\n");
    fw_loop(firewall_handle,  /* 防火墙句柄 */show_firewall_fules,  /* 回调函数的名字 */NULL); /* 传递给回调函数的参数 */
    /* 注册回调函数，对每个规则循环调用回调函数，输出所有规则信息 */
    firewall_rule = (struct fw_rule*)malloc(sizeof(struct fw_rule));
    firewall_rule->fw_op = FW_OP_BLOCK;
    /* 操作类型为禁止 */
    firewall_rule->fw_dir = FW_DIR_IN;
    /* 方向为进入 */
    strcpy(firewall_rule->fw_device, "eth0");
    /* 网络接口为eth0 */
    firewall_rule->fw_proto = 6;
    /* 协议为6，表示TCP协议 */
    addr_aton("192.168.0.4", &firewall_rule->fw_src);
    /* 源IP地址 */
    addr_aton("192.168.0.5", &firewall_rule->fw_dst);
    /*
     * 目的IP地址* fw_add(firewall_handle, firewall_rule);
     * /*添加规则
     */
    firewall_rule->fw_op = FW_OP_BLOCK;
    /* 操作类型为禁止 */
    firewall_rule->fw_dir = FW_DIR_OUT;
    /* 方向为出去 */
    strcpy(firewall_rule->fw_device, "eth0");
    /* 网络接口为eth0 */
    firewall_rule->fw_proto = 6;
    /* 协议为6，表示TCP协议 */
    addr_aton("192.168.0.5", &firewall_rule->fw_src);
    /* 源IP地址 */
    addr_aton("192.168.0.4", &firewall_rule->fw_dst);
    /* 目的IP地址 */
    fw_add(firewall_handle, firewall_rule);
    /* 添加规则 */
    firewall_rule->fw_op = FW_OP_BLOCK;
    /* 操作类型为禁止 */
    firewall_rule->fw_dir = FW_DIR_OUT;
    /* 方向为出去 */
    strcpy(firewall_rule->fw_device, "eth0");
    /* 网络接口为eth0 */
    firewall_rule->fw_proto = 6;
    /* 协议为6表示TCP协议 */
    addr_aton("192.168.0.5", &firewall_rule->fw_src);
    /* 源IP地址 */
    addr_aton("192.168.0.4", &firewall_rule->fw_dst);
    /* 目的IP地址 */
    fw_delete(firewall_handle, firewall_rule);
    /* 删除规则 */
    fw_close(firewall_handle);
    /* 关闭防火墙操作 */
}
