import ReactDOM from 'react-dom/client'

import {
  createBrowserRouter,
  RouterProvider
} from 'react-router-dom'

import SignInForm from './pages/SignInForm'
import SignUpForm from './pages/SignUpForm'
import ErrorPage from './pages/ErrorPage'
import HomePage from './pages/HomePage'

const router = createBrowserRouter([
  {
    path: '/',
    element: <HomePage />,
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

ReactDOM.createRoot(document.getElementById('root')).render(
  <RouterProvider router={router} />
)
