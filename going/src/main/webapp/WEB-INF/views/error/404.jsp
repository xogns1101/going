<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Yeon+Sung&display=swap" rel="stylesheet">

  <style>
    html, body {
      background: url(/assets/img/fire-meong.jpg) no-repeat center;
      background-size: cover;
      width: 100%;
      height: 100%;
      overflow: hidden;
    }
    .errorsign{
    width: 945px;
    height: 400px;
    position: absolute;
    float: left;
    left: 50px;
    top: 150px;
    text-align: center;
    opacity: 0.9;
    font-size: 57px;
    color: #e2fcca;
    text-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
    animation: shine 0.9s infinite alternate;
    font-family: "Yeon Sung", system-ui;
    font-weight: 400;
    font-style: normal;
}
@keyframes shine {
            from {
                text-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
            }
            to {
                text-shadow: 0 4px 16px rgba(0, 0, 0, 0.8), 0 0 8px rgba(255, 255, 255, 0.8);
            }
        }

 @font-face {
    font-family: 'YEONGJUSeonbiTTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/2403@1.0/YEONGJUSeonbiTTF.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}


       
  .container {
      text-align: center;
  }
  
  p {
      color: #6c757d;
  }
  a {
      text-decoration: none;
      font-size: 20px;
      font-weight: bold;
  }
  </style>

  
</head>
<body>
  <canvas></canvas>
  

  <h1 class="errorsign">이 페이지는<br> 아직 준비중 입니다 <br>죄송합니다</h1>
  <div class="container">
    <p><a href="/main">메인 화면으로 이동하기</a></p>
    <p><a href="#" onclick="history.back(); return false;">이전 화면으로 돌아가기</a></p>
  </div>


  <script>


const canvas = document.querySelector('canvas')
canvas.width = window.innerWidth
canvas.height = window.innerHeight
const ctx = canvas.getContext('2d')

const TOTAL = 150
const petalArray = []

const petalImg = new Image()
petalImg.src = '/assets/img/star.png'
petalImg.onload = () => {
  for (let i = 0; i < TOTAL; i++) {
    petalArray.push(new Petal())
  }
  render()
}

function render() {
  ctx.clearRect(0, 0, canvas.width, canvas.height)
  petalArray.forEach(petal => {
    petal.animate()
  })

  window.requestAnimationFrame(render)
}

window.addEventListener('resize', () => {
  canvas.width = window.innerWidth
  canvas.height = window.innerHeight
})


class Petal {
  constructor() {
    this.x = Math.random() * canvas.width
    this.y = Math.random() * canvas.height * 2 - canvas.height
    this.w = 30 + Math.random() * 15
    this.h = 20 + Math.random() * 10
    this.opacity = this.w / 45
    this.xSpeed = 2 + Math.random()
    this.ySpeed = 1 + Math.random() * 0.5
    this.flip = Math.random()
    this.flipSpeed = Math.random() * 0.03
  }

  draw() {
    if (this.y > canvas.height || this.x > canvas.width) {
      this.x = -petalImg.width
      this.y = Math.random() * canvas.height * 2 - canvas.height
      this.xSpeed = 2 + Math.random()
      this.ySpeed = 1 + Math.random() * 0.5
      this.flip = Math.random()
    }
    ctx.globalAlpha = this.opacity
    ctx.drawImage(
      petalImg,
      this.x,
      this.y,
      this.w * (0.66 + (Math.abs(Math.cos(this.flip)) / 3)),
      this.h * (0.8 + (Math.abs(Math.sin(this.flip)) / 2)),
    )
  }

  animate() {
    this.x += this.xSpeed
    this.y += this.ySpeed
    this.draw()
    this.flip += this.flipSpeed
  }
}
  </script>
  
</body>
</html>
