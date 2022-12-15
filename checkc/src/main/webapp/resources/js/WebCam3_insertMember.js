//DOM
const recordButton = document.querySelector(".record-button");
const stopButton = document.querySelector(".stop-button");
const playButton = document.querySelector(".play-button");
const downloadButton = document.querySelector(".download-button");
const previewPlayer = document.querySelector("#preview");
//const previewPlayer = document.getElementById('myVideo');
const recordingPlayer = document.querySelector("#recording");
let recorder; //녹화기 초기화용 변수
let recordedChunks; //녹화영상 담을 저장공간 배열
let videoBlob = null; // 비디오 url로 보낼때 쓸 blob
let recordedVideoURL = null; //url 주소

var meberno;  //세션 아이디값
//functions
function videoStart() {//화면 출력용 함수. 계속 일정하게 카메라 보이게 사용
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    navigator.mediaDevices.getUserMedia({  //미디어 디바이스에서 영상 읽어오기
       
    	video: true//화면 출력용은 사이즈 변경없이 보이기
        //video:{ facingMode: "user" } //모바일 전면카메라 요청   
          , audio: false
    })
        .then(stream => {
            previewPlayer.srcObject = stream;
            startRecording(previewPlayer.captureStream())//영상재생중 녹화하기위해 사용  

            previewPlayer.play()           
        })
}

function videoready() { //카메라 녹화용 함수. 카메라 녹화를위해 계속 재시작
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    navigator.mediaDevices.getUserMedia({  //미디어 디바이스에서 영상 읽어오기
       
    	video: { width: 640 , height: 480 } // 인코딩 사이즈 변경. 너무 작게 하면 인코딩 안되서 용량 늘어남. 
        //video:{ facingMode: "user" } //모바일 전면카메라 요청   
          , audio: false
    })
        .then(stream => {
            previewPlayer.srcObject = stream;
            startRecording(previewPlayer.captureStream())//영상재생중 녹화하기위해 사용   
        })
}
    
function startRecording(stream  ) {//녹화되는 스트림받아온다
    recordedChunks = [];
    recorder = new MediaRecorder(stream); //녹화기를 호출하여 스트림을(실시간영상)을 파라미터로 넘기기 
    //recorder = new MediaRecorder(stream,{mimeType: 'video/webm; codecs=vp9,opus'});
    recorder.ondataavailable = (event) => { 
        console.log("data recodedchunks push! ")
        recordedChunks.push(event.data) }
    //recordedChunks.push(stream)
    recorder.start(); // 녹화기 시작, 위의 녹화기가 시작됨.
}
function stopRecording()	  {
    //previewPlayer.srcObject.getTracks().forEach(track => track.stop());  // 실시간 영상을 중단시킨다. 
    //previewPlayer.srcObject.getTracks().forEach(track => track.start)//영상 blob로 저장후 다시 영상정보를 얻기위해 트랙 start
    //녹화기 정지, 위에서 실시간 영상을 중지시킨후, 녹화기도 중지시킨다
    recorder.stop()
    //recorder = null;    
    //console.log(recordedChunks) // 저장되는 blob비디오 정보 표시  
}
function playRecording() { //기존의 녹화된영상을 웹에서 재생하는 기능 대신 영상을 인코딩에서 jsp로 보내는 역활을 함	
	  videoBlob = new Blob(recordedChunks, { type: "mp4; codecs=h.264" });
	    console.log(videoBlob)
	   recordedVideoURL = window.URL.createObjectURL(videoBlob)
	    //서버 호출 함수
	   	sendAvi(videoBlob);	   
	    console.log("서버 전송 시작");

}


//비동기식 슬립

function sleep(ms) {
    return new Promise((r) => setTimeout(r, ms));
    console.log(`sleep for ${ms}ms`);
}

//동기 슬립함수
/*
function sleep(ms) {
	  const wakeUpTime = Date.now() + ms;
	  while (Date.now() < wakeUpTime) {}
	}
*/
window.onload = videoStart()	;

//회원가입 버튼을 누르면 녹화후 전송 실행
document.getElementById("insertMembtn").addEventListener('click',Membtn);


// 팝업창 띄우기
var testPopUp;

function openPopUp() {//대기 해달라는 html창 띄우기
    testPopUp= window.open("resources\\html\\WaitMemVid.html", "PopupWin", "width=400,height=300");
}

function closePopUp(){//자동 창 닫기
    testPopUp.close();
}

async function Membtn(){//회원가입 버튼 클릭시 실행되는 함수
	await openPopUp()
	await videoready()
	read_member()
     await sleep(5000)
     stopRecording()
     await sleep(10)
     playRecording2()
     await sleep(10)
	await closePopUp()
}


// 영상 서버로 보내기 ajax 이용

const sendAvi = blob => {  //sendAvi = 서버로 보내는메서드
    if (blob == null) return; //데이터 없으면 반환
  //현재시간을 이용해 파일이름 만들기
    var today = new Date();
    var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var dateString = year + '_' + month  + '_' + day+'_'; //날짜 포맷으로 변경
var today = new Date();   
var hours = ('0' + today.getHours()).slice(-2); 
var minutes = ('0' + today.getMinutes()).slice(-2);
var seconds = ('0' + today.getSeconds()).slice(-2); 
var timeString = hours + '_' + minutes  + '_' + seconds;//시간포맷으로 변경
var title = 'vid_';
var newfilename = title+meberno+"_"+dateString+timeString;

    //let filename = newfilename + ".avi";
    let filename = newfilename + ".mp4";  //파일이름 처리. 확장자 붙이기
    //let filename = newfilename + ".webm";
    const file = new File([blob], filename);
    let fd = new FormData();
    fd.append("fname", filename);
    fd.append("file", file);
    
    console.log("test!!!!!!")
    
    $.ajax({
        url: "http://127.0.0.1:5000/inserttheaf", //데이터 보낼  url 입력
        type: "POST",
        contentType: false, // 이 옵션과 아래옵션 모두 false로 해놔야 전송 가능  false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
        processData: false, // false로 선언 시 formData를 string으로 변환하지 않음
        data: fd, //전송할 데이터가 담긴 변수 변수
        success: function (data, textStatus) { //성공시 넘어온 데이터를 받는다.
            if (data != null) { //성공시 받아온 데이터가 있다면
                console.log("동영상 서버 전송 성공");
                //console.log(data) //서버에서 받아온 응답 데이터 출력
                //setUsdaterResponse(data);  //데이터 처리
                //send(a);
            }
        },
        error: function (errorMessage) { //실패시 호출
            // setUserResponse("");
            console.log("동영상 서버 전송 실패" + errorMessage);
        },
    }).done(function (data) { // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
        console.log("영상 전송 HTTP 요청이 성공하였습니다.");
        console.log(data);
    });
}

let latitude = 0;
let longitude = 0;
let currntspeed = 0 ;

function gpsloc() {
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition(function (pos) {

            laltitue = pos.coords.latitude
            longitude = pos.coords.longitude
            currentspeed = pos.coords.speed

            console.log("gps 측정. laltitue :"+laltitue)
            console.log("longitude :"+longitude)
            console.log("currentspeed :"+currentspeed)

            /*
                        $('#latitude').html(pos.coords.latitude);     // 위도
                        $('#longitude').html(pos.coords.longitude); // 경도
                        */
            let tempgps =[laltitue,longitude,currentspeed]//배열로 변경
            
            
            for(let i=0;i<tempgps.length;i++){//gps값 서버 전송 전에 null값 0으로 치환
            	if(tempgps[i]==null){
            		tempgps[i]=0;
            	}
            
            }
            
                 
          
            $.ajax({
                url: "http://localhost:8085/controller/gps/insert", //데이터 보낼  url 입력
                type: "POST",
                traditional : true,
                 data: {"tempgps":tempgps}, //전송할 데이터가 담긴 변수 변수
                success: function (data, textStatus) { //성공시 넘어온 데이터를 받는다.
                    if (data != null) { //성공시 받아온 데이터가 있다면
                        console.log("gps 서버 전송 성공");
                        //setUsdaterResponse(data);  //데이터 처리
                        //send(a);
                    }
                },
                error: function (errorMessage) { //실패시 호출
                    // setUserResponse("");
                    console.log("gps 서버 전송 실패" + errorMessage);
                },
            }).done(function (data) { // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
               });

        });
    } else {
        console.log("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }
}


function playRecording2() { //기존의 녹화된영상을 웹에서 재생하는 기능 대신 영상을 인코딩에서 jsp로 보내는 역활을 함	
	  videoBlob = new Blob(recordedChunks, { type: "mp4; codecs=h.264" });
	    console.log(videoBlob)
	   recordedVideoURL = window.URL.createObjectURL(videoBlob)
	    //서버 호출 함수
	   	sendAvi2(videoBlob);	   
	    console.log("서버 전송 시작");
}

const sendAvi2 = blob => {  //sendAvi = 서버로 보내는메서드
    if (blob == null) return; //데이터 없으면 반환
    //현재시간을 이용해 파일이름 만들기
    var today = new Date();
    var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var dateString = year + '_' + month  + '_' + day+'_'; //날짜 포맷으로 변경
var today = new Date();   
var hours = ('0' + today.getHours()).slice(-2); 
var minutes = ('0' + today.getMinutes()).slice(-2);
var seconds = ('0' + today.getSeconds()).slice(-2); 
var timeString = hours + '_' + minutes  + '_' + seconds;//시간포맷으로 변경
var title = 'vid_';
var newfilename = title+dateString+timeString;

    //let filename = newfilename + ".avi";
    let filename = newfilename + ".mp4";  //파일이름 처리. 확장자 붙이기
    //let filename = newfilename + ".webm";
    const file = new File([blob], filename);
    let fd = new FormData();
    fd.append("fname", filename);
    fd.append("file", file);
    
    console.log("test!!!!!!")
    
    $.ajax({
        url: "http://localhost:8085/controller/file/insertmemvid", //데이터 보낼  url 입력
        type: "POST",
        contentType: false, // 이 옵션과 아래옵션 모두 false로 해놔야 전송 가능  false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
        processData: false, // false로 선언 시 formData를 string으로 변환하지 않음
        data: fd, //전송할 데이터가 담긴 변수 변수
        success: function (data, textStatus) { //성공시 넘어온 데이터를 받는다.
            if (data != null) { //성공시 받아온 데이터가 있다면
                console.log("동영상 서버 전송 성공");
                //console.log(data) //서버에서 받아온 응답 데이터 출력
                //setUsdaterResponse(data);  //데이터 처리
                //send(a);
            }
        },
        error: function (errorMessage) { //실패시 호출
            // setUserResponse("");
            console.log("동영상 서버 전송 실패" + errorMessage);
        },
    }).done(function (data) { // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
        console.log("영상 전송 HTTP 요청이 성공하였습니다.");
        console.log(data);
    });
}




function read_member(){
	//let m_no = ${loginMember.m_no}
	//let meberno = sessionStorage.getItem('oginMember.m_no');
	//var meberno= window.sessionStorage.getItem("loginuser") 
	meberno = document.getElementById('loginuser').value
	console.log("로그인 멤버 아이디 : " +meberno)

	}

