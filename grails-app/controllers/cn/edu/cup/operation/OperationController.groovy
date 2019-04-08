package cn.edu.cup.operation

import grails.converters.JSON

class OperationController {

    def commonQueryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def list() {
        prepareParams()
        println("${params}")
        def result = commonQueryService.listFunction(params)
        def view = result.view
        flash.message = result.message
        processResult(result)
        if (request.xhr) {
            render(template: view, model: [objectList: result.objectList, flash: flash])
        } else {
            respond result.objectList
        }
    }

    def count() {
        prepareParams()
        def count = commonQueryService.countFunction(params)
        def result = [count: count]

        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    protected void prepareParams() {}

    protected void processResult(result) {}

    def index() { }
}
