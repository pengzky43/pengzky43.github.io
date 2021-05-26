function collapse() {
			document.getElementById("DEADBEEF").classList.toggle('transform');
			if(document.getElementById("collapse1").style.opacity == "1"){
				document.getElementById("collapse1").style.opacity = "0";
				document.getElementById("DEADBEEF").classList.remove('fa');
				document.getElementById("DEADBEEF").classList.add('fa');
				document.getElementById("DEADBEEF").classList.remove('fa-times');
				document.getElementById("DEADBEEF").classList.add('fa-comment-alt');
				document.getElementById("DEADBEEF").classList.remove('fa-lg');
				document.getElementById("DEADBEEF").classList.add('fa-lg');
			}
			else{
				document.getElementById("collapse1").style.opacity = "1";
				document.getElementById("DEADBEEF").classList.remove('fa');
				document.getElementById("DEADBEEF").classList.add('fa');
				document.getElementById("DEADBEEF").classList.remove('fa-comment-alt');
				document.getElementById("DEADBEEF").classList.add('fa-times');
				document.getElementById("DEADBEEF").classList.remove('fa-lg');
				document.getElementById("DEADBEEF").classList.add('fa-lg');
				
			}
		}