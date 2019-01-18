{extends file='route.tpl'}
{block name='body'}
  <div style='min-height: 68vh; padding: 30px'>
    <style>
      canvas{
        background: #ccc
      }
    </style>
    <canvas id="myCanvas" width="1200" height = "780">
        <script src="/javascripts/lotteryGame.js"></script>
    </canvas>
  </div>
{/block}