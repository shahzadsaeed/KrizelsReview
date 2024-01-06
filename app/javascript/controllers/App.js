import React from "react";
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Clock from "./Clock";
import Count from "./Count";

const App = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route exact path="/clock" element={<Clock />} />
        <Route exact path="/count" element={<Count />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App;