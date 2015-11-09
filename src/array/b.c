char *cli_errorcode_string[RST_MAX + 1] = {
    [RST_OK] = "[OK]",
    [RST_NO_MEM] = "[MALLOC FAILED]",
    [RST_READ_FRU_ERR] = "[READ FRU ERROR]",
    [RST_INVLD_PRM] = "[INVALID PARAMETER]",
    [RST_NOT_SUPPORT] = "[NOT SUPPORT ON PRESENT VERSION]",
    [RST_LOG_RW_FAILED] = "[LOG READ/WRITE FAILED]",
    [RST_INT_ERR] = "[INTERNAL ERROR]",
    [RST_MAX] = "[RST_UNKNOWN_ERR]",
};