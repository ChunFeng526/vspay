        $(function () {
            var container = $('#container');
            var list = $('#list');
            var buttons = $('#buttons span');
            var prev = $('#prev');
            var next = $('#next');
            var index = 1;
            var len = 5;
            var interval = 5000;
            var timer;


            function animate (offset) {
                var left = parseInt(list.css('left')) + offset;
                if (offset>0) {
                    offset = '+=' + offset;
                }
                else {
                    offset = '-=' + Math.abs(offset);
                }
                list.animate({'left': offset}, 300, function () {
                    if(left > -200){
                        list.css('left', -1210 * len);
                    }
                    if(left < (-1210 * len)) {
                        list.css('left', -1210);
                    }
                });
            }

            function showButton() {
                buttons.eq(index-1).addClass('on').siblings().removeClass('on');
            }

            function play() {
                timer = setTimeout(function () {
                    next.trigger('click');
                    play();
                }, interval);
            }
            function stop() {
                clearTimeout(timer);
            }

            next.bind('click', function () {
                if (list.is(':animated')) {
                    return;
                }
                if (index == 5) {
                    index = 1;
                }
                else {
                    index += 1;
                }
                animate(-1210);
                showButton();
            });

            prev.bind('click', function () {
                if (list.is(':animated')) {
                    return;
                }
                if (index == 1) {
                    index = 5;
                }
                else {
                    index -= 1;
                }
                animate(1210);
                showButton();
            });

            buttons.each(function () {
                 $(this).bind('click', function () {
                     if (list.is(':animated') || $(this).attr('class')=='on') {
                         return;
                     }
                     var myIndex = parseInt($(this).attr('index'));
                     var offset = -1210 * (myIndex - index);

                     animate(offset);
                     index = myIndex;
                     showButton();
                 })
            });

            container.hover(stop, play);

            play();
        });            












