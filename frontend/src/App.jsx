import { useEffect, useState } from 'react';

function App() {
  const [message, setMessage] = useState('Loading...');

  useEffect(() => {
    fetch('/api')
      .then(res => res.text())
      .then(data => setMessage(data))
      .catch(() => setMessage('Error fetching API'));
  }, []);

  return <h1>{message}</h1>;
}

export default App;
