var x = window.open('https://dashboard.y.uno/auth/login');
function checkTokenInWindow(winRef) {
    const intervalo = 3000;
  
    try {
      const url = new URL(winRef.location.href);
      const token = url.searchParams.get('token');
  
      if (token) {
        alert(`Token found: ${token}`);
      } else {
        setTimeout(() => checkTokenInWindow(winRef), intervalo);
      }
    } catch (error) {
      console.error('Cannot access window href:', error);
      setTimeout(() => checkTokenInWindow(winRef), intervalo);
    }
  }
setTimeout(()=>{
    checkTokenInWindow(x)
},2000)
