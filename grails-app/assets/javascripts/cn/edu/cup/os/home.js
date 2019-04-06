$(function () {
    console.info("home...");

    /* 统计在线人数 */
    ajaxRun("home/countOnlineUsers", 0, "onlineCount")
});
