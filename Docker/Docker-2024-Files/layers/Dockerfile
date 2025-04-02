FROM almalinux:8
# here I need to pull something from internet
RUN echo "Hello World"
RUN yum install nginx -y
RUN echo "Hello, Welcome to Dockerfile. A way of creating own images" > /usr/share/nginx/html/hello.html
RUN yum install git -y \
    && yum install maven -y \
    && yum install gcc -y
# here I need to pull something from internet
CMD [ "nginx", "-g", "daemon off;" ]
