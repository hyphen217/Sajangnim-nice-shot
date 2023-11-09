function makeFormData(keys, values) {
	// 기본 배열로 돌아감. 문자열이 온 경우 배열로 변환
	if (!Array.isArray(keys)) {
		keys = [keys];
		values = [values];
	}
	const formDataArray = keys.map((key, index) => key + '=' + values[index]);
	return formDataArray.join('&');
}

/* AJAX :: POST */
// 컨트롤러로 전달할 서비스 코드, key=value형태의 데이터, 콜백함수
function sendAjaxPost(serviceCode, formData, callBackFunction) {
	fetch(serviceCode, {
		method: 'POST',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: formData,
	})
		.then(response => {
			if (response.ok) {
				const clonedResponse = response.clone(); // Clone the response
				return response.json().catch(() => clonedResponse.text()); // Try parsing original response as JSON, if fails, get text from cloned response
			} else {
				throw new Error('Network response was not ok.');
			}
		})
		.then(data => window[callBackFunction](data))
		.catch(error => console.error('Error:', error));
}

function login() {
    const form = document.createElement('form')
    document.body.appendChild(form)
    form.method = 'post'
    form.action = '/login'
    const memNickname = document.querySelector('#memNickname')
    form.appendChild(memNickname)
    form.submit()
}