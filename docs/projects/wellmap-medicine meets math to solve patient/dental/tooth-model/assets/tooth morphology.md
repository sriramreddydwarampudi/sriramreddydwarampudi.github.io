
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Tooth Geometry 3D</title>
  <style>
    body {
      background: #111;
      color: white;
      font-family: sans-serif;
      perspective: 1000px;
      display: flex;
      gap: 60px;
      justify-content: center;
      padding: 50px;
    }

    .scene {
      transform-style: preserve-3d;
      transform: rotateX(-15deg) rotateY(30deg);
      width: 150px;
      height: 150px;
      position: relative;
    }

    .face {
      position: absolute;
      width: 150px;
      height: 150px;
      background: rgba(200, 200, 200, 0.1);
      border: 1px solid #666;
      display: grid;
      grid-template: repeat(3, 1fr) / repeat(3, 1fr);
      color: white;
      font-size: 10px;
    }

    .face div {
      display: flex;
      align-items: center;
      justify-content: center;
      border: 0.5px solid #444;
    }

    .top { transform: rotateX(90deg) translateZ(75px); }
    .bottom { transform: rotateX(-90deg) translateZ(75px); }
    .front { transform: rotateY(0deg) translateZ(75px); }
    .back { transform: rotateY(180deg) translateZ(75px); }
    .left { transform: rotateY(-90deg) translateZ(75px); }
    .right { transform: rotateY(90deg) translateZ(75px); }

    .classV { background-color: #4caf50; }
    .occlusal { background-color: gold; }
    .label { text-align: center; margin-bottom: 10px; }

    /* Prism version (flat front only) */
    .prism {
      width: 150px;
      height: 150px;
      position: relative;
      clip-path: polygon(0% 100%, 0% 0%, 100% 100%);
      background: rgba(100, 200, 255, 0.1);
      border: 1px solid #777;
      display: grid;
      grid-template: repeat(3, 1fr) / repeat(3, 1fr);
    }

    .prism div {
      display: flex;
      align-items: center;
      justify-content: center;
      border: 0.5px solid #444;
      color: white;
      font-size: 10px;
    }

    .class3 { background-color: skyblue; }
    .class4 { background-color: violet; }
  </style>
</head>
<body>

  <div>
    <div class="label"><strong>Molar Cube</strong><br>Buccal Surface</div>
    <div class="scene">
      <div class="face front">
        <div></div><div class="occlusal">Occlusal</div><div></div>
        <div></div><div></div><div></div>
        <div class="classV">Class V</div><div class="classV">Class V</div><div class="classV">Class V</div>
      </div>
      <div class="face back"></div>
      <div class="face top"></div>
      <div class="face bottom"></div>
      <div class="face left"></div>
      <div class="face right"></div>
    </div>
  </div>

  <div>
    <div class="label"><strong>Incisor Prism</strong><br>Labial Surface</div>
    <div class="prism">
      <div></div><div></div><div class="class4">Class IV</div>
      <div></div><div class="class3">Class III</div><div></div>
      <div class="classV">Class V</div><div></div><div></div>
    </div>
  </div>
  


</body>
</html>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Tooth Geometry 3D</title>
  <style>
    body {
      background: #111;
      color: white;
      font-family: sans-serif;
      perspective: 1000px;
      display: flex;
      gap: 60px;
      justify-content: center;
      padding: 50px;
      flex-wrap: wrap;
    }

    .scene, .prism-scene {
      transform-style: preserve-3d;
      transform: rotateX(-15deg) rotateY(30deg);
      position: relative;
    }

    .scene {
      width: 150px;
      height: 150px;
    }

    .prism-scene {
      width: 100px;
      height: 200px;
    }

    .face, .rect-face {
      position: absolute;
      background: rgba(200, 200, 200, 0.1);
      border: 1px solid #666;
      display: grid;
      grid-template: repeat(3, 1fr) / repeat(3, 1fr);
      color: white;
      font-size: 10px;
    }

    .face div, .rect-face div {
      display: flex;
      align-items: center;
      justify-content: center;
      border: 0.5px solid #444;
    }

    .face {
      width: 150px;
      height: 150px;
    }

    .rect-face {
      width: 100px;
      height: 200px;
    }

    .top { transform: rotateX(90deg) translateZ(75px); }
    .






