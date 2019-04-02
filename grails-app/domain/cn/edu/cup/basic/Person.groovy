package cn.edu.cup.basic

class Person {

    String code
    String name

    static constraints = {
        code(unique: true)
        name(nullable: false)
    }

    String toString() {
        return "${name}"
    }
}
