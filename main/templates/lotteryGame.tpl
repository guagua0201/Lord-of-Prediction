{extends file='route.tpl'}
{block name='body'}
  <div style='min-height: 68vh; padding: 30px'>
      <script src="https://cdn.jsdelivr.net/npm/phaser@3.15.1/dist/phaser-arcade-physics.min.js"></script>
      <div style='min-height: 68vh; text-align: center' id='game_block' class='jumborton'>
        <script src='/javascripts/lotteryGame.js'></script>
      </div>
  </div>
{/block}
