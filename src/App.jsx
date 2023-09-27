import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { CssBaseline } from '@mui/material'

import Home from './pages/Home'
import SignInForm from './pages/SignInForm'
import SignUpForm from './pages/SignUpForm'
import ErrorPage from './pages/ErrorPage'

const router = createBrowserRouter([
  {
    path: '/',
    element: <Home />,
    errorElement: <ErrorPage />
  },
  {
    path: '/login',
    element: <SignInForm />
  },
  {
    path: '/signup',
    element: <SignUpForm />
  }
])

const App = () => {
  return (
    <>
      <CssBaseline />
      <RouterProvider router={router} />
    </>
  )
}

export default App
