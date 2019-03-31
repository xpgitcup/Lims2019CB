package cn.edu.cup.init

import cn.edu.cup.basic.Caption
import grails.gorm.transactions.Transactional

import javax.servlet.ServletContext

@Transactional
class InitService {
    def grailsApplication
    def dataSource
    def systemMenuService
    def captionService
    def commonService

    /**
     * 初始化代码__开发环境下的初始化代码
     */
    def configureForDevelopment(ServletContext servletContext) {
        println "这是开发环境..."
        println(grailsApplication.metadata.getApplicationName())
        processConfigFile(servletContext)
    }

    /*
    * 处理ocnfig.json文件
    * */

    private void processConfigFile(ServletContext servletContext) {
        def webRootDir = servletContext.getRealPath("/")

        // 先处理数据库脚本文件
        def configFileName = "${webRootDir}/config/scriptList.json"
        def scriptList = [:]
        scriptList = commonService.importObjectListFromJsonFileName(configFileName, scriptList.getClass())
        println("处理脚本：${scriptList}")
        scriptList.each { e ->
            switch (e.key) {
                case "dir":
                    loadScripts(e.value)
                    break
                case "file":
                    def sfile = new File(e.value)
                    executeScript(sfile)
                    break
            }
        }

        // 处理应用程序名称、图标等信息
        def captionsFileName = "${webRootDir}/config/captions.json"
        if (captionService.count()<1) {
            def captions = commonService.importObjectListFromJsonFileName(captionsFileName, Caption.class)
            captions.each { e->
                captionService.save(e)
            }
        }
    }

    /**
     * 发布后的初始化代码
     */
    def configureForProduction(ServletContext servletContext) {
        println "这是发布环境..."
        processConfigFile(servletContext)
    }

    /*
    * 加载数据库初始化脚本
    * */

    def loadScripts(String dir) {
        File sf = new File(dir)
        if (sf.exists()) {
            println "load scripts ${dir}"
            if (sf.isDirectory()) {
                sf.eachFile { f ->
                    if (f.isFile()) {
                        executeScript(f)
                    }
                }
            } else {
                println("执行${sf}...")
                executeScript(sf)
            }
        }
    }

    /**
     * 执行附加脚本
     * */

    def executeScript(File sf) {
        //def File sf = new File(fileName)
        println "init - ${sf}"
        if (sf) {
            def db
            def sql = sf.text
            db = new groovy.sql.Sql(dataSource)
            //println "init - ${sql}"
            def lines = sql.split(";")
            lines.each() { it ->
                //println "line: ${it}"
                it = it.trim()
                if (!it.isEmpty()) {
                    db.executeUpdate(it)
                }
            }
        }
    }

}
