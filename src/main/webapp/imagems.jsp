<%--
  Created by IntelliJ IDEA.
  User: gda_a
  Date: 15/09/2023
  Time: 01:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    html {
        font-family: system-ui;
        background: lightgray;
        --dsn-accent: #777;
        --box-shadow: 0 5px 10px rgba(0,0,0,.25);
        --border-radius: 5px;
        /*   padding: 2rem 1rem; */
        scroll-behavior: smooth;
        /*   scroll-snap-type: y mandatory; */
    }

    body {
        margin: 0;
        padding: 0;
        overflow-y: scroll;
        overflow-x: hidden;
    }

    * {
        box-sizing: border-box;
    }

    #add_new_board,
    #zoom,
    #save_me {
        width: 50px;
        aspect-ratio: 1 / 1;
        line-height: 50px;
        text-align: center;
        font-weight: 500;
        position: fixed;
        bottom: 1rem;
        right: 1rem;
        background: #f8f8f8;
        color: gray;
        font-size: 2rem;
        box-shadow: var(--box-shadow);
        border-radius: 50%;
        user-select: none;
        cursor: pointer;
        transform-origin: 50% 100%;
    }
    #zoom {
        transform: translateX(-125%) scale(.75);
    }
    #save_me {
        transform: translateX(-225%) scale(.75);
    }
    .zoomed {
        overflow: hidden;
    }

    #trailer {
        transform-origin: 50% 0%;
        transition: .5s;
    }

    .board_con {
        width: 100vw;
        min-height: 100vh;
        display: grid;
        place-items: center;
        overflow: hidden;
        scroll-snap-align: start;
        font-family: var(--font-select);
        background-color: lightgray;
    }

    .board_con .hold_me {
        width: 1200px;
        margin: 0 auto;
        filter: drop-shadow(0 5px 10px rgba(0,0,0,.25));
        background: #f8f8f8;
        position: relative;
        font-size: 0;
    }

    .board_options {
        position: absolute;
        top: 100%;
        left: 1rem;
        background: #f8f8f8;
    }

    .board_options div {
        width: 3rem;
        aspect-ratio: 1 / 1;
        text-align: center;
        font-size: 2rem;
        line-height: 2.75rem;
        cursor: pointer;
        user-select: none;
        float: left;
        position: relative;
    }
    .board_options div:hover {
        background-color: #efefef;
    }
    .board_options div:first-child:after {
        content:'';
        width: 1px;
        height: 60%;
        background-color: lightgray;
        position: absolute;
        left: 100%;
        top: 20%;
        transform: translateX(-50%);
    }

    .delete_board {

    }

    .image_name {
        width: 100%;
        position: absolute;
        top: 0px;
        left: 0px;
        background: #f8f8f8;
        color: gray;
        font-size: 10px;
        padding: .25rem;
        border: 1px solid lightgray;
        font-family: system-ui !important;
        margin: 0;
    }

    .image_drop_area {
        box-shadow: inset 0 0 0 1px lightgray;
    }

    canvas {
        width: 0;
        height: 0;
    }

    #left_con {
        width: 70%;
        display: inline-block;
        position: relative;
    }

    .imgg {
        width: calc(100% - 1rem);
        aspect-ratio: 6 / 4;
        position: relative;
        margin: 1rem 0 0 1rem;
        border-radius: 0;
        background-size: cover;
        background-position: 50% 50%;
        background-color: #efefef;
        display: grid;
        place-items: center;
        display: inline-block;
        vertical-align: top;
        border-right: 0;
    }
    .start_text {
        color: #bbb;
        pointer-events: none;
        font-size: 1.5rem;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
        margin: 0;
    }

    #pals,
    #vibe {
        display: inline-block;
        vertical-align: top;
    }
    #pals {
        width: 100%;
        transform: translateY(-40px);
        position: absolute;
        left: 0;
        top: 100%;
    }
    #vibe {
        /*   position: absolute; */
        right: 0;
        top: 0;
        width: 30%;
    }

    h3 {
        width: 33%;
        color: var(--dsn-accent);
        border-bottom: 1px solid var(--dsn-accent);
        text-transform: uppercase;
    }

    #palette,
    #comp {
        width: 100%;
        display: block;
        text-align: center;
    }
    #palette {
        height: 75px;
    }

    #palette div,
    #comp div {
        width: 75px;
        aspect-ratio: 1 / 1;
        display: inline-block;
        margin: 0 .5rem;
        border: 4px solid #f8f8f8;
        box-shadow: var(--box-shadow);
        position: relative;
    }
    #palette div:first-child,
    #comp div:first-child {
        margin-left: 0;
    }
    #palette div span,
    #comp div span{
        width: 100%;
        display: block;
        text-align: center;
        position: relative;
        top: 120%;
        color: #222;
        font-size: .8rem;
        font-family: system-ui !important;
    }

    #palette input,
    #comp input {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        border-radius: 50%;
        opacity: 0;
        cursor: pointer;
    }

    #typo {
        margin-top: 3.25rem;
    }

    #ex_type {
        font-size: 1.25rem;
        text-align: center;
    }

    #font_pane {
        width: 300px;
        height: 100vh;
        background: #f8f8f8;
        position: fixed;
        right: 0;
        top: 0;
        z-index: 100;
        box-shadow: -5px 0 10px rgba(0,0,0,.25);
        overflow-y: scroll;
        padding: 1rem;
        transform: translateX(110%);
        transition: .5s;
    }
    .open_fonts {
        transform: translateX(0%) !important;
    }

    .font_btn {
        width: 100%;
        height: 5%;
        font-size: 1.1rem;
        border-radius: 0;
        border: 0;
        background: none;
    }
    .font_btn:hover {
        cursor: pointer;
        background: #efefef;
    }

    .choose_font {
        font-size: 1.5rem;
        font-weight: 900;
        color: #222;
        margin-bottom: .5rem;
        border-radius: var(--border-radius);
        width: fit-content;
        background: none;
        border: 1px solid lightgray;
        display: inline-block;
        vertical-align: top;
        padding: .25rem 1rem;
        cursor: pointer;
        font-family: var(--font-select);
    }

    .font_ex {
        display: inline-block;
        width: 50%;
    }

    #ex_type span {
        /*   width: 100%; */
        width: 420px;
        display: inline-block;
        text-align: left;
        margin-left: 1rem;
        font-size: 2rem;
        font-family: var(--font-select);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .vibe_image {
        width: calc(100% - 2rem);
        margin: 1rem 0 0 1rem;
        vertical-align: top;
        aspect-ratio: 3 / 2;
        background:
                url('https://contentservice.mc.reyrey.net/image_v1.0.0/?id=ef9d5a33-4d09-5201-bd6a-a499e240d0f4&637989624410293334'),
                #efefef;
        display: block;
        background-size: cover;
        background-position: 50% 50%;
        position: relative;
        overflow: hidden;
    }
    .vibe_image:last-child {
        margin-bottom: 1rem;
    }

    ::-webkit-scrollbar {
        width: 5px;
    }
    ::-webkit-scrollbar-thumb {
        background: gray;
        border-radius: var(--border-radius);
    }
    ::-webkit-scrollbar-track {
        background: lightgray;
        border-radius: var(--border-radius);
    }
</style>
<head>
    <title>Title</title>
</head>
<body>
<div id='font_pane'></div>
<div id='add_new_board' title='Add new board'><span class="material-icons">add</span></div>
<div id='zoom' title='Zoom in/out' onclick='zoom_in_out()'><span class="material-icons">zoom_in</span></div>
<div id='save_me' title='Export ALL boards' onclick='saveAllBoards(this)'><span class="material-icons">download</span></div>

<div id='trailer'>
    <div id='board_1' class='board_con'>
        <div class='hold_me'>
            <div class='board_options'>
                <div class='delete_board' onclick='saveBoard(this)' title='Export this board'><span class="material-icons">download</span></div>
                <div class='delete_board' onclick='delete_board(this)' title='Delete this board'><span class="material-icons">delete</span></div>
            </div>
            <div id='left_con'>
                <div id='' class='imgg image_drop_area'>
                    <p class='start_text'>Drag and drop an image here</p>
                    <p class='image_name'></p>
                </div>

                <div id='pals'>
                    <div id="palette"></div>
                    <div id='typo'>
                        <div id='ex_type'>
                            <button class='choose_font' data-board='board_1' onclick='open_fonts(this)'>Select Font</button>
                            <div class='font_ex'>
                                <span contenteditable="true">Sample Text Can Be Changed</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id='vibe'>
                <div id='vibe_images'>
                    <div class='vibe_image image_drop_area'><p class='image_name'></p></div>
                    <div class='vibe_image image_drop_area'><p class='image_name'></p></div>
                    <div class='vibe_image image_drop_area'><p class='image_name'></p></div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://unpkg.com/color.js@1.2.0/dist/color.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js'></script>

<link href="https://fonts.googleapis.com/css2?family=Lora&family=Merriweather&family=Playfair+Display&family=Roboto+Slab&family=Roboto&family=Open+Sans&family=Montserrat&family=Lato&family=Bebas+Neue&family=Comfortaa&family=Lobster&family=Abril+Fatface&family=Dancing+Script&family=Pacifico&family=Shadows+Into+Light&family=Caveat&family=Roboto+Mono&family=Inconsolata&family=Source+Code+Pro&family=IBM+Plex+Mono&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<canvas id="canvas"></canvas>


<script>
    let google_fonts = ['Lora','Merriweather','Playfair Display','Roboto Slab','Roboto','Open Sans','Montserrat','Lato','Bebas Neue','Comfortaa','Lobster','Abril Fatface','Dancing Script','Pacifico','Shadows Into Light','Caveat','Roboto Mono','Inconsolata','Source Code Pro','IBM Plex Mono'],
        standard_fonts = ["Arial","Arial Rounded","Bahnschrift","Calibri","Candara","Century Gothic","Corbel","Franklin Gothic Medium","Lucida Sans Unicode","Microsoft Sans Serif","News Gothic MT","Segoe UI","Tahoma","Trebuchet MS","Verdana","Book Antiqua","Calisto MT","Cambria","Constantia","Georgia","Lucida","Palatino Linotype","Times New Roman","Bauhaus","Broadway","Comic Sans MS","Cooper Black","Copperplate Gothic","Freestyle Script","Gabriola","Goudy Stout","Harlow Solid Italic","Impact","Westminster","Wide Latin","Consolas","Courier New","Lucida Console","Academy Engraved","American Typewriter","Athelas","Baskerville MT","Big Caslon","Bodoni 72","Canela","Cochin","Charter","Didot","Domaine","Hoefler Text","Iowan Old Style","Marion","New York","Produkt","Publico","STIX Fonts","Superclarendon","Palatino","PT Serif","Rockwell","Times","Adelle Sans","Avenir","Avenir Next","DIN","Druk","Euphemia UCAS","Founders Grotesk","Futura","Geneva","Gill Sans","Graphik","Helvetica","Helvetica Neue","Lucida Grande","Myriad Arabic","Noto Sans","October","PT Sans","Optima","Phosphate","Proxima Nova","San Francisco","Seravek","Skia","Andalé Mono","Apple Braille","Courier","Menlo","Monaco","PT Mono","SF Mono","Spot Mono","Apple Chancery","Bradley Hand Bold","Brush Script MT","Chalkboard","Chalkduster","Comic Sans","Copperplate","Herculanum","Luminari","Marker Felt","Noteworthy","Pilgiche","Papyrus","Quotes","Sauber Script","Savoye LET","SignPainter","Snell Roundhand","Trattatello","Zapfino"],
        fonts = []

    for (const font of standard_fonts.values()) {
        if (document.fonts.check(`12px "${font}"`)) {
            fonts.push(font);
        }
    }

    var all_fonts = fonts.concat(google_fonts)
    all_fonts.sort()
    console.log(all_fonts)

    var cf = document.querySelectorAll('.choose_font'),
        trailer = document.querySelector('#trailer'),
        fp = document.querySelector('#font_pane'),
        board,
        new_board = document.querySelector('#add_new_board'),
        image_drop_area,
        file_name;

    for(var i=0;i<all_fonts.length;i++) {
        var f = document.createElement('button')
        f.className = 'font_btn'
        f.style.fontFamily = all_fonts[i]
        f.innerHTML = all_fonts[i]
        f.onclick = function() {
            // console.log(board)
            var b = document.querySelector('#'+board)
            b.style.setProperty('--font-select', this.innerHTML)
            b.querySelector('.choose_font').innerHTML = this.innerHTML
            this.parentElement.classList.remove('open_fonts')
        }

        document.querySelector('#font_pane').appendChild(f)
    }

    function open_fonts(e){
        fp.classList.add('open_fonts')
        board = e.dataset.board
        // console.log(board)
    }

    new_board.addEventListener('click', function() {
        if(document.querySelector('.zoomed')) {
            zoom_in_out()
        }
        var nb = document.createElement('div')
        var num = Number(document.querySelectorAll('.board_con')[document.querySelectorAll('.board_con').length - 1].id.split('_')[1])
        nb.id = 'board_'+ (num + 1)
        nb.className = 'board_con'
        var copy = document.querySelector('.board_con').innerHTML
        nb.innerHTML = copy
        trailer.appendChild(nb)

        document.querySelectorAll('.board_con')[document.querySelectorAll('.board_con').length - 1].querySelector('.choose_font').dataset.board = 'board_'+ (num + 1)

        window.scrollTo({left: 0, top: document.body.scrollHeight, behavior: "smooth"});

        runDropAreas()
    })

    function runDropAreas() {
        image_drop_area = document.querySelectorAll(".image_drop_area");
        var uploaded_image,
            drop_box;

        // Event listener for dragging the image over the div
        for(var i=0;i<image_drop_area.length;i++) {
            image_drop_area[i].addEventListener('dragover', (event) => {
                event.stopPropagation();
                event.preventDefault();
                // Style the drag-and-drop as a "copy file" operation.
                event.dataTransfer.dropEffect = 'copy';
            });

            // Event listener for dropping the image inside the div
            image_drop_area[i].addEventListener('drop', (event) => {
                event.stopPropagation();
                event.preventDefault();
                fileList = event.dataTransfer.files;
                drop_box = event.target
                file_name = fileList[0].name
                // console.log(fileList[0])
                // document.querySelector("#file_name").textContent = fileList[0].name;

                readImage(fileList[0]);
            });

            // Converts the image into a data URI
            readImage = (file) => {
                if(drop_box.querySelector('.start_text')){
                    drop_box.querySelector('.start_text').remove()
                }

                var reader = new FileReader();
                var image = new Image();

                image.onload = () => {
                    const canvas = document.getElementById("canvas");
                    canvas.width = image.width;
                    canvas.height = image.height;
                    const ctx = canvas.getContext("2d");
                    ctx.drawImage(image, 0, 0);
                };

                reader.addEventListener('load', (event) => {
                    uploaded_image = event.target.result;
                    drop_box.style.backgroundImage = `url(${uploaded_image})`;
                    drop_box.querySelector('.image_name').innerHTML = file_name
                    // console.log(drop_box.id)
                    if(drop_box.classList.contains('imgg')) {
                        image.src = reader.result;
                        colorjs.prominent(image, {
                            amount: 5,
                            group: 50,
                            sample: 10,
                            format: 'hex' }).then(color => {
                            drop_box.parentElement.querySelector('#palette').innerHTML = ''
                            // comp.innerHTML = ''
                            for(var i=0;i<color.length;i++) {
                                var b = document.createElement('div')
                                b.style.background = color[i]
                                b.innerHTML = `<span>${color[i].toUpperCase()}</span>`

                                var ci = document.createElement('input')
                                ci.type = 'color'
                                ci.value = color[i]
                                ci.onchange = function() {
                                    var v = this.value
                                    this.parentElement.style.background = v
                                    this.parentElement.querySelector('span').innerHTML = v
                                }
                                if(i==2 || i==3 || i==4) {    }
                                drop_box.parentElement.querySelector('#palette').appendChild(b).appendChild(ci)

                                if(i == 2) {
                                    document.documentElement.style.setProperty('--bg-accent', color[i])
                                }
                            }
                            // console.log(color)
                        })
                    }

                });
                reader.readAsDataURL(file);
            }
        }
    }

    runDropAreas()

    function save_me() {
      var htmlContent = document.body.outerHTML;
      console.log(htmlContent)
      var bl = new Blob([htmlContent], {type: "text/html"});
      var a = document.createElement("a");
      a.href = URL.createObjectURL(bl);
      a.download = "your-download-name-here.html";
      a.hidden = true;
      document.body.appendChild(a);
      a.innerHTML = "something random - nobody will see this, it doesn't matter what you put here";
      a.click();
    }

    function delete_board(e) {
        if(document.querySelectorAll('.board_con').length > 1) {
            if(window.confirm('Are you sure you want to delete this board?')) {
                e.parentElement.parentElement.parentElement.remove()
            }
        }
    }

    function zoom_in_out() {
        if(trailer.classList.contains('zoomed')) {
            trailer.style.transform = ''
            trailer.classList.remove('zoomed')
        } else {
            var n = document.querySelectorAll('.board_con').length
            trailer.style.transform = 'scale('+(1/n)+')'
            trailer.classList.add('zoomed')
            window.scrollTo({left: 0, top:0, behavior: "smooth"});
        }
    }

    function saveBoard(e) {  html2canvas(e.parentElement.parentElement.parentElement,{scrollY: -window.scrollY}).then(

        function(canvas) {
            // document.body.appendChild(canvas);
            let save_name = prompt('Name your file...',e.parentElement.parentElement.parentElement.id)
            if(save_name != null) {
                saveAs(canvas.toDataURL(), save_name);
            }
        })
    }

    function saveAllBoards(e) {  html2canvas(trailer, {scrollY: -window.scrollY}).then(
        function(canvas) {
            // document.body.appendChild(canvas);
            let save_name = prompt('Name your file...','All Boards')
            if(save_name != null) {
                saveAs(canvas.toDataURL(), save_name);
            }
        })
    }

    function saveAs(uri, filename) {
        // window.open(uri);
        var link = document.createElement('a');
        if (typeof link.download === 'string') {

            link.href = uri;
            link.download = filename;

            //Firefox requires the link to be in the body
            document.body.appendChild(link);

            //simulate click
            link.click();

            //remove the link when done
            document.body.removeChild(link);

        } else {
            window.open(uri);
        }
    }

    //alert('')

</script>
</body>
</html>
