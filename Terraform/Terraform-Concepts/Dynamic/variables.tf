variable "ingressrules"{
    type= list
    default = [
                    {
                    description      = "Allow From SSH"
                    from_port        = 22
                    to_port          = 22
                    protocol         = "tcp"
                    cidr_blocks      = ["0.0.0.0/0"] 
                },
                {
                    description      = "Allow From HTTP"
                    from_port        = 80
                    to_port          = 80
                    protocol         = "tcp"
                    cidr_blocks      = ["0.0.0.0/0"] 
                },
                {
                    description      = "Allow From HTTPS"
                    from_port        = 443
                    to_port          = 443
                    protocol         = "tcp"
                    cidr_blocks      = ["0.0.0.0/0"] 
                }
        
    ]
}

variable "tags"{
    type = map

default = { 
    Name = "roboshop"
    project = "roboshop"
    terraform = "true"
    environment = "dev"
}
}