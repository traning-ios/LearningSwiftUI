		function toNormalText(text){
			var str = text;
			str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");
			str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");
			str = str.replace(/ì|í|ị|ỉ|ĩ/g,"i");
			str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");
			str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");
			str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");
			str = str.replace(/đ/g,"d");
			str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g,"A");
			str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g,"E");
			str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g,"I");
			str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g,"O");
			str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g,"U");
			str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g,"Y");
			str = str.replace(/Đ/g,"D");
			return str;

		}
		function toTeenCode1(text){
			text = toNormalText(text);
			text = text.toLowerCase();
			textArr = text.split(' ');
			for(i in textArr){
				var word = textArr[i];
				if(word.indexOf('y')>=0){
					if(word.indexOf('ay')>=0){
					
					}else if(word.indexOf('uy')>=0){
						word = word.replace('uy', 'y');
					}else{
						word = word.replace('y', 'i');
					}
				}
				word = word.replace(/ch$/g, "x");
				word = word.replace(/^ph/g,"f");
				//word = word.replace(/^k/g,"c");
				word = word.replace(/^kh/g,"k");
				word = word.replace(/^gi/g,"j");
				word = word.replace(/^gh/g,"g");
				word = word.replace(/^ngh/g,"ng");
				word = word.replace(/^qu/g,"q");

				word = word.replace(/ng$/g, "g");
				word = word.replace(/nh$/g, "h");

				// word = word.replace('h', 'k');
				word = word.replace('i', 'j');

				textArr[i] = word;

			}
			return textArr.join(' ');

		}
	function toTeenCode2(text){
		text = toNormalText(text);
		text = text.toUpperCase();
		textArr = text.split(' ');
		for(i in textArr){
			var word = textArr[i];
			word = word.replace(/A/g, "4");
			word = word.replace(/B/g, "13");
			word = word.replace(/C/g, "6");
			word = word.replace(/D/g, "10");
			word = word.replace(/E/g, "3");
			word = word.replace(/G/g, "9");
			word = word.replace(/H/g, "76");
			word = word.replace(/I/g, "1");
			word = word.replace(/K/g, "14");
			word = word.replace(/L/g, "2");
			word = word.replace(/M/g, "111");
			word = word.replace(/N/g, "11");
			word = word.replace(/O/g, "0");
			word = word.replace(/P/g, "19");
			word = word.replace(/Q/g, "62");
			word = word.replace(/R/g, "12");
			word = word.replace(/S/g, "5");
			word = word.replace(/T/g, "7");
			word = word.replace(/U/g, "21");
			word = word.replace(/Ư/g, "22");
			word = word.replace(/V/g, "17");
			word = word.replace(/X/g, "96");
			word = word.replace(/Y/g, "29");
			word = word.replace(/X/g, "96");
			textArr[i] = word;

		}
		return textArr.join(' ');
	}
	function toTeenCode3(text) {
		text = toNormalText(text);
		text = text.toLowerCase();
		var flipTable = { a : '\u0250', b : 'q', c : '\u0254', d : 'p', e : '\u01DD', f : '\u025F', g : '\u0183', h : '\u0265', i : '\u0131', j : '\u027E', k : '\u029E', l : '\u0283', m : '\u026F', n : 'u', r : '\u0279', t : '\u0287', v : '\u028C', w : '\u028D', y : '\u028E', '.' : '\u02D9', '[' : ']', '(' : ')', '{' : '}', '?' : '\u00BF', '!' : '\u00A1', "\'" : ',', '<' : '>', '_' : '\u203E', ';' : '\u061B', '\u203F' : '\u2040', '\u2045' : '\u2046', '\u2234' : '\u2235', '\r' : '\n'
		}
		var last = text.length - 1;
		var result = new Array(text.length);
		for (var i = last; i >= 0; --i) {
			var c = text.charAt(i);
			var r = flipTable[c];
			result[last - i] = r != undefined ? r : c;
		}
		return result.join('');
	}

	
	function toTeenCode4(text){
		text = toNormalText(text);
		text = text.toUpperCase();
		textArr = text.split(' ');
		for(i in textArr){
			var word = textArr[i];
			word = word.replace(/A/g, "4");
			word = word.replace(/E/g, "3");
			word = word.replace(/G/g, "q");
			if(word[0]=="H"){
				word[0] = 'h';
			}else{
				word = word.replace(/KH/g, "kh");
				word = word.replace(/H/g, "k");
			}
			word = word.replace(/I/g, "j");
			word = word.replace(/O/g, "0");
			textArr[i] = word;

		}
		return textArr.join(' ').toLowerCase();
	}
	function toTeenCode5(text){
		text = text.replace(/l/g,'n');
		text = text.replace(/L/g,'N');
		return text;
	}
	function toTeenCode6(text){
		text = text.toLowerCase();
		textArr = text.split(' ');
		for(i in textArr){
			var word = textArr[i];
			var isMatch = null;
			isMatch = word.match(/^([a|à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|e|è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|i|ì|í|ị|ỉ|ĩ|o|ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|u|ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|y|ỳ|ý|ỵ|ỷ|ỹ|A|À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ|E|È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ|I|Ì|Í|Ị|Ỉ|Ĩ|O|Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ|U|Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ|Y|Ỳ|Ý|Ỵ|Ỷ|Ỹ]{1})/g);
			if(isMatch!=null){
				word = "ngh"+word;
			}
			
			word = word.replace(/^([ngh]{3}|[ch|gh|gi|kh|ng|nh|ph|qu|th|tr]{2}|[b|c|d|đ|g|h|k|l|m|n|p|q|r|s|t|v|x]{1})/g,'nh');
			textArr[i] = word;

		}
		return textArr.join(' ').toLowerCase();
	}
	function toTeenCode7(text){
		text = text.toLowerCase();
		textArr = text.split(' ');
		for(i in textArr){
			var word = textArr[i];
			var isMatch = null;
			
			word = word.replace(/b/g, '|3');
			word = word.replace(/đ/g, '+)');
			word = word.replace(/d/g, '])');
			word = word.replace(/l/g, '|_');
			word = word.replace(/á|ắ|ấ/g, '4\'');
			word = word.replace(/à|ằ|ầ/g, '4`');
			word = word.replace(/a|ă|â/g, '4');
			word = word.replace(/ả|ẳ|ẩ/g, '4');
			word = word.replace(/ạ|ặ|ậ/g, '4');
			word = word.replace(/ã|ẵ|ẫ/g, '4');
			word = word.replace(/é|ế/g, '3\'');
			word = word.replace(/ẻ|ể/g, '3?');
			word = word.replace(/è|ề/g, '3`');
			word = word.replace(/e|ê/g, '3');
			word = word.replace(/ẽ|ễ/g, '3');
			word = word.replace(/i/g, 'j');
			word = word.replace(/ì/g, 'j`');
			word = word.replace(/í/g, 'j\'');
			word = word.replace(/ỉ/g, 'j');
			word = word.replace(/ĩ/g, 'j');
			word = word.replace(/ỏ|ổ|ở/g, '0');
			word = word.replace(/o|ô|ơ/g, '0');
			word = word.replace(/ò|ồ|ờ/g, '0`');
			word = word.replace(/ó|ố|ớ/g, '0\'');
			word = word.replace(/õ|ỗ|ỡ/g, '0');
			word = word.replace(/ọ|ộ|ợ/g, '0.');
			word = word.replace(/ú|ứ/g, 'u\'');
			word = word.replace(/ù|ừ/g, 'u`');
			word = word.replace(/ủ|ử/g, 'u');
			word = word.replace(/ũ|ữ/g, 'u');
			word = word.replace(/ụ|ự/g, 'u.');
			word = word.replace(/u|ư/g, 'u');
			word = word.replace(/y/g, 'ij');

			textArr[i] = word;

		}
		return textArr.join(' ').toLowerCase();
	}
	function toTeenCode8(text){
		text = text.toLowerCase();
		textArr = text.split(' ');
		for(i in textArr){
			var word = textArr[i];
			var isMatch = null;
			
			word = word.replace(/á|ắ|ấ/g, 'Cl\'');
			word = word.replace(/à|ằ|ầ/g, 'Cl`');
			word = word.replace(/a|ă|â/g, 'Cl');
			word = word.replace(/ả|ẳ|ẩ/g, 'Cl');
			word = word.replace(/ạ|ặ|ậ/g, 'Cl');
			word = word.replace(/ã|ẵ|ẫ/g, 'Cl');

			word = word.replace(/é|ế/g, 'F_\'');
			word = word.replace(/ẻ|ể/g, 'F_');
			word = word.replace(/è|ề/g, 'F_`');
			word = word.replace(/e|ê/g, 'F_');
			word = word.replace(/ẽ|ễ/g, 'F_');
			word = word.replace(/ẹ|ệ/g, 'F_');


			word = word.replace(/ỏ|ổ|ở/g, 'º');
			word = word.replace(/o|ô|ơ/g, 'º');
			word = word.replace(/ò|ồ|ờ/g, 'º`');
			word = word.replace(/ó|ố|ớ/g, 'º\'');
			word = word.replace(/õ|ỗ|ỡ/g, 'º');
			word = word.replace(/ọ|ộ|ợ/g, 'º');

			word = word.replace(/i/g, ']');
			word = word.replace(/ì/g, ']`');
			word = word.replace(/í/g, ']\'');
			word = word.replace(/ỉ/g, ']');
			word = word.replace(/ĩ/g, ']');
			word = word.replace(/ị/g, ']');

			word = word.replace(/ú|ứ/g, 'µ\'');
			word = word.replace(/ù|ừ/g, 'µ`');
			word = word.replace(/ủ|ử/g, 'µ');
			word = word.replace(/ũ|ữ/g, 'µ');
			word = word.replace(/ụ|ự/g, 'µ');
			word = word.replace(/u|ư/g, 'µ');

			word = word.replace(/d/g, '])');
			word = word.replace(/đ/g, '+)');

			word = word.replace(/n/g, ']\\[');
			word = word.replace(/h/g, '†|');
			word = word.replace(/g/g, '(¬');
			word = word.replace(/k/g, ']<');
			word = word.replace(/t/g, '†');
			word = word.replace(/v/g, '\\/');
			word = word.replace(/m/g, '/v\\');
			word = word.replace(/^qu/g,"v\\/");
			word = word.replace(/r/g, 'Pv');
			word = word.replace(/w/g, 'v\\/');
			word = word.replace(/y/g, '¥');
			word = word.replace(/s/g, '§');
			word = word.replace(/x/g, '><');
			word = word.replace(/p/g, ']º');
			word = word.replace(/b/g, ']3');
			word = word.replace(/c/g, '(');

			textArr[i] = word;

		}
		return textArr.join(' ');
	}

	function toTeenCode9(text, s){
		//text = text.toLowerCase();
		if(s === undefined){
			s = "\'s";
		}
		textArr = text.split(' ');
		for(i in textArr){
			var word = textArr[i];
			symbol = "~`!@#$%^&*()_-+={}[]:>;'.,</?*-+";
			if(word.match(/[^A-Za-z0-9]/g)==null){
				word = word + s;
			}else{
				var spArr = word.match(/[^A-Za-z0-9]/g);
				var pos = word.length;
				for(x in spArr){
					if(symbol.indexOf(spArr[x])!=-1){
						pos = word.indexOf(spArr[x]);
						break;
					}

				}
				word = [word.slice(0, pos), s, word.slice(pos)].join('');
					
			}
			
			
			textArr[i] = word;

		}
		return textArr.join(' ');
	}
	function toTeenCode10(text){
		return toTeenCode9(text, "\'ss");
	}
	function toTeenCode11(text){
		return toTeenCode9(text, "\'sss");
	}
	function toTeenCode12(text){
		text = text.toLowerCase();
		textArr = text.split(' ');
		for(i in textArr){
			var word = textArr[i];
			word = word.split('');
			var rand = Math.floor((Math.random() * 10) + 1);
			if(rand<=5){
				j = 0;
			}else{
				j = 1;
			}
			for(j;j<word.length;j+=2){
				word[j] = word[j].toUpperCase();
			}
			textArr[i] = word.join('');

		}
		return textArr.join(' ');
	}
	function changeNoteColor(color){
		var note = jQuery("#note")
		jQuery(note).removeClass();
		jQuery(note).addClass("note");
		jQuery(note).addClass("note-"+color);
		jQuery("#color").val(color);
		jQuery("#saveType").val('1');
	}
	function timeSince(date) {
	    var seconds = Math.floor((new Date() - date) / 1000);

	    var interval = Math.floor(seconds / 31536000);

	    if (interval > 1) {
	        return interval + " years";
	    }
	    interval = Math.floor(seconds / 2592000);
	    if (interval > 1) {
	        return interval + " months";
	    }
	    interval = Math.floor(seconds / 86400);
	    if (interval > 1) {
	        return interval + " days";
	    }
	    interval = Math.floor(seconds / 3600);
	    if (interval > 1) {
	        return interval + " hours";
	    }
	    interval = Math.floor(seconds / 60);
	    if (interval > 1) {
	        return interval + " minutes";
	    }
	    return Math.floor(seconds) + " seconds";
	}
	
	function recaptchaCallback() {
	    jQuery("#btnSaveImageToServer").addClass('can-submit');
	};
	function removeHighLight(){
		setTimeout(function(){
			jQuery('.high-light').removeClass('high-light');
		}, 2000);
	}
	jQuery( document ).ready(function() {

		jQuery(".main-slider").owlCarousel({
			lazyLoad : true,
		    navigation : false, // Show next and prev buttons
		    slideSpeed : 300,
		    paginationSpeed : 400,
		    singleItem:true
		
		    // "singleItem:true" is a shortcut for:
		    // items : 1, 
		    // itemsDesktop : false,
		    // itemsDesktopSmall : false,
		    // itemsTablet: false,
		    // itemsMobile : false
		
		});
		jQuery(".left-slider").owlCarousel({
			lazyLoad : true,
		    navigation : false, // Show next and prev buttons
		    slideSpeed : 300,
		    paginationSpeed : 400,
		    singleItem:true
		
		    // "singleItem:true" is a shortcut for:
		    // items : 1, 
		    // itemsDesktop : false,
		    // itemsDesktopSmall : false,
		    // itemsTablet: false,
		    // itemsMobile : false
		
		});

		new Clipboard('.btn-copy');

		

	// jQuery(".box-title").hover(function(){jQuery(this).parent().find(".popup").stop().toggle(400);});
	jQuery(".output-wrapper").click(function(){
		if($( window ).width() <= 1024){
			jQuery(this).addClass("clicked");
		}
	});
	jQuery(".btn-clear").click(function(e){
		e.preventDefault();
		jQuery(".loading").show();
		jQuery("#input-text").val("");
		jQuery("#out-text").val("");
		setTimeout(function() { jQuery(".loading").hide() }, 700);
	});
	jQuery(".btn-copy").click(function(e){
		e.preventDefault();
		jQuery(".loading").show();
		setTimeout(function() { jQuery(".loading").hide() }, 700);
	});
	jQuery(".output-wrapper").hover(
		function() {
			jQuery(this).addClass("clicked");
		}, function() {
			jQuery(this).removeClass("clicked");
		}
	);

	jQuery(".checkbox").click(function(event){
		var originText = jQuery("#input-text").val();
		var outputText = "";
		jQuery(".button-container input[type='checkbox']").prop('checked', "");
		
		jQuery(".output-wrapper").removeClass("clicked");
		
		var input = jQuery(this).find("input");
		jQuery(input).prop("checked", "checked");

		if(jQuery(input).hasClass("code1")){
			outputText = toTeenCode1(originText);
		}
		if(jQuery(input).hasClass("code2")){
			outputText = toTeenCode2(originText);
		}
		if(jQuery(input).hasClass("code3")){
			outputText = toTeenCode3(originText);
		}
		if(jQuery(input).hasClass("code4")){
			outputText = toTeenCode4(originText);
		}
		if(jQuery(input).hasClass("code5")){
			outputText = toTeenCode5(originText);
		}
		if(jQuery(input).hasClass("code6")){
			outputText = toTeenCode6(originText);
		}
		if(jQuery(input).hasClass("code7")){
			outputText = toTeenCode7(originText);
		}
		if(jQuery(input).hasClass("code8")){
			outputText = toTeenCode8(originText);
		}
		if(jQuery(input).hasClass("code9")){
			outputText = toTeenCode9(originText);
		}
		if(jQuery(input).hasClass("code10")){
			outputText = toTeenCode10(originText);
		}
		if(jQuery(input).hasClass("code11")){
			outputText = toTeenCode11(originText);
		}
		if(jQuery(input).hasClass("code12")){
			outputText = toTeenCode12(originText);
		}
		jQuery(".loading").show();
		setTimeout(function() { jQuery(".loading").hide() }, 700);
		
		jQuery("#output-text").val(outputText);
		jQuery(".note-content").text(outputText);

	});
    jQuery("#btnSave").click(function() {
    	var canvas = document.getElementById("canvas");
    	jQuery("canvas").attr('height', jQuery(".note-container").height()+40+'px')
    	rasterizeHTML.drawHTML(jQuery(".note-container").html(), canvas);

    	setTimeout(function(){
	    	var data = canvas.toDataURL("image/png");

			var img = document.createElement('img');
			img.src = data;

			var a = document.createElement('a');
			a.setAttribute("download", "YourFileName.png");
			a.setAttribute("href", data);
			a.setAttribute('id', 'out-image');
			a.appendChild(img);
			jQuery("body").append(a);
	        //document.body.removeChild(canvas);
	        jQuery(img).click();
	        jQuery("#out-image").remove();
        }, 1000);
    });
    jQuery("#btnSaveImageToServer").click(function(event){
    	if(jQuery(this).hasClass('can-submit')){
	    	jQuery("#saveType").val('1');
	    	jQuery("#submitContentForm").submit();
	    	jQuery('.captcha').removeClass('high-light');
	    }else{
	    	jQuery('.captcha').addClass('high-light');
	    }
    	if(jQuery('#input-text').val() == ''){
			jQuery('#input-text').addClass('high-light');
		}
		jQuery('html, body').animate({
          scrollTop: jQuery('.high-light').offset().top - 100
        }, 1000);
	    removeHighLight();
    });
    jQuery("#sign").keyup(function(){
    	jQuery(".signature").text(jQuery(this).val());
    });
    jQuery("#sign").keypress(function( e ) {
		if ( e.which == 13 ) {
			e.preventDefault();
		}
	});
	jQuery("#submitContentForm").submit(function(e){
		if(jQuery('#input-text').val() == ''){
			e.preventDefault();
		    return false;
		}
	});
    jQuery("#menu-btn").click(function(){
    	jQuery("#top-menu .menu").toggle(400);
    	jQuery("#menu-btn .after").toggleClass('rotate180');
    	jQuery("#top-menu .menu .menu-item a > .before").toggleClass('rotate-90');
    });
    jQuery(window).scroll(function(){
		var top = jQuery(this).scrollTop() + jQuery('nav.navbar').outerHeight();
		if(top > 300){
			jQuery("#header").addClass('shrink');
		}else{
			jQuery("#header").removeClass('shrink');
		}
	});


	});