package cn.edu.cup.system

class SystemStatus {

    String sessionId
    Date loginTime = new Date()
    Date logoutTime
    String userName
    String userRole

    static hasMany = [items: SystemStatusItem]

    static constraints = {
        sessionId()
        loginTime(nullable: true)
        logoutTime(nullable: true)
        userName(nullable: true)
        userRole(nullable: true)
    }

    String toString() {
        return "${sessionId}.${items?.size()}"
    }
}
