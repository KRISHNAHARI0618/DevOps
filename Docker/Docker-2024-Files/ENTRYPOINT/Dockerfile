FROM almalinux:8
# almalinux is same as centos
RUN yum install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html
RUN echo "Hello, Welcome to Dockerfile. A way of creating own images" > /usr/share/nginx/html/index.html
# damon off command makes our container running and attached to screen
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

# FROM run:v1
# RUN echo "Hello, Welcome to Dockerfile. A way of creating own images" > /usr/share/nginx/html/hello.html
# # damon off command makes our container running and attached to screen
# CMD [ "nginx", "-g", "daemon off;" ]
