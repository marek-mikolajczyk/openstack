variable "user_names" {
    default = ["tommy", "lee", "jones"]
    type = list(string)
}


variable "user_names2" {
    type = list(string)
    default =["ala", "ola", "ela"]
}