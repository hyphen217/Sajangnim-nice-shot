<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myPage</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet"><link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/AJW.css" />
<script src="/js/KDB.js"></script>
<style>
</style>
</head>

<body>
	<header class="header">
	<img id="logo" onclick="location.href='/'" src="/img/SNP_LOGO4.png" />
		<div>
			<input id="memNickname" name="memNickname" placeholder="닉네임" />
			<button onclick="login()">로그인</button>
		</div>
	</header>
	<main>
		<aside>
			<div id="aside-main" onclick="location.href='/'">메인페이지</div>
			<div onclick="location.href='/moveReservation'">예약</div>
			<div onclick="location.href='/moveMyPage'">마이페이지</div>
			<div onclick="location.href=''">이벤트</div>
		</aside>

      <section>
   		<div id="h3" onclick="location.href='/moveMyPage'">마이페이지로 돌아가기</div>
	   		<table class = "table_style1" id="table1">
	   		<div id="h5">예약이 완료되었습니다.</div>
	   			<tr></tr>
	        </table>
	  </ul>
      </section>
   </main>
   
   
   <section1>

   
   </section1>
</body>
<script>
        if (`${message}` !== ``) {alert(`${message}`);
        }
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
        let rsvDetail = JSON.parse(`${rsvDetail}`);
        console.log(rsvDetail);
        
        let postType = rsvDetail;
        createTable(); 
        function createTable() {
            const table = document.querySelector('#table1');
            table.innerHTML = `<th class = "th_style">예약번호</th>
            					<th class = "th_style">예약자명</th>
                                <th class = "th_style">예약날짜</th>
                                <th class = "th_style">예약시간</th>
                                <th class = "th_style">인원수</th>`;
                                
            postType.forEach((detail) => {
                const tr1 = document.createElement('tr');
                tr1.innerHTML =
                    `<td class = "td_style">` + detail.rsvCode + `</td>
                    <td class = "td_style">` + detail.rsvMemNickname + `</td>
                    <td class = "td_style">` + detail.rsvDate + `</td>
                    <td class = "td_style">` + detail.rsvTime + `</td>
                    <td class = "td_style">` + detail.rsvCount+ `</td>`;
                table.appendChild(tr1);
            });
                
            table.innerHTML += `<th class = "th_style">HOLE</th>
						          <th class = "th_style">CADDY</th>
						          <th class = "th_style">CLOTHES</th>
						          <th class = "th_style">SHOES</th>
						          <th class = "th_style">총가격</th>`;
            		
            
            postType.forEach((detail) => {    
                const tr3 = document.createElement('tr');
                    if (detail.pricesBean && detail.pricesBean.length > 0) {
                        const pricesBean = detail.pricesBean[0];
                        tr3.innerHTML +=
                            `<td class = "td_style">` + pricesBean.priOption1 + "홀" + `</td>
                            <td class = "td_style">` + pricesBean.priOption2 + `</td>
                            <td class = "td_style">` + pricesBean.priOption3 + `</td>
                            <td class = "td_style">` + pricesBean.priOption4 + `</td>
                            <td class = "td_style">` + detail.rsvPrice + "원" + `</td>`;
                    } 
                table.appendChild(tr3);
            });
        
        }
        
        
    </script>
</html>
