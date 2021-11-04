<!-- from: https://www.cnblogs.com/wstong/p/12874732.html -->
<!-- Live2DCubismCore script -->
<script src="https://cdn.jsdelivr.net/gh/wangstong/live2dm3/live2d/js/live2dcubismcore.js"></script>
<!-- Build script -->
<script src="https://cdn.jsdelivr.net/gh/wangstong/live2dm3/live2d/js/bundle.js"></script>
<canvas id="live2d" width="400" height="600" class="live2d" style="position: fixed; opacity: 0.8; left: -70px; bottom: -250px; z-index: 99999; pointer-events: none;"></canvas>

<script type="text/javascript">
    var resourcesPath = '/live2d_models/'; // 指定资源文件（模型）保存的路径
    var backImageName = ''; // 指定背景图片
    var modelDir = ['AijoKaren']; // 指定需要加载的模型
    initDefine(resourcesPath, backImageName, modelDir); // 初始化模型
</script>