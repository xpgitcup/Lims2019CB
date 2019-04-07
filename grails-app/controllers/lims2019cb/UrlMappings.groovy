package lims2019cb

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/indexCup20190406")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
