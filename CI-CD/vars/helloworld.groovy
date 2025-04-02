#!groovy

def naam(name){
  echo "My Name is ${name}"
}

def mapping(Map configMap){
  def name = configMap.get('name')
  def course = configMap.get('course')
  echo "My Variables are ${name}"
  echo "My Variables are ${course}"
}

def add(x,y){
  echo "Addition of two number ${x},${y} is ${x+y} "
}