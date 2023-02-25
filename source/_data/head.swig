<!-- Pollyfill script -->
<script src="https://unpkg.com/core-js-bundle@3.6.1/minified.js"></script>
<!-- Live2DCubismCore script -->
<script src="https://cdn.jsdelivr.net/gh/MichiyamaKaren/live2dv3-kanban@1.1/Demo/static/js/live2dcubismcore.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-ui@1.13.2/dist/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/gh/MichiyamaKaren/live2dv3-kanban@1.1/Demo/static/js/canvas2image.js"></script>

<link rel="stylesheet" type="text/css" href="/css/live2d.css" />

<script src="https://cdn.jsdelivr.net/gh/MichiyamaKaren/live2dv3-kanban@1.1/dist/l2dkanban.min.js"></script>

<script type="text/javascript">
    L2Dsettings.configPath = '/live2d_models/config.json';
    L2Dsettings.resourcesPath = '/live2d_models/';  // 指定资源文件（模型）保存的路径
    L2Dsettings.backImageName = ''; // 指定背景图片
    L2Dsettings.modelDirs = 'karen,karen_school'.split(',');
    L2Dsettings.canvasId = 'live2d';

    L2Dsettings.onModelLoaded = (model) => {
        model.setExpression("onLoad");
        model.startMotion("onLoad", 0, 2);
    };

    window.onload = setupKanban;
</script>

<div class="live2d-main">
    <div class="live2d-tips"></div>
    <canvas id="live2d" class="live2d"></canvas>
    <div class="live2d-tool"></div>
</div>