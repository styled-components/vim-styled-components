/* @flow */
import styled, { keyframes } from 'styled-components';


const rotate360 = keyframes`
  from {
    transform: rotate(0deg);
  }

  to {
    transform: rotate(360deg);
  }
`;


const StyledButton = styled.button`
  background-color: papayawhip;
  color: palevioletred;

  padding: 15px 20px 25px auto;
  margin: 0;

  position: absolute;
  background: ${props => props.image ? `url(${props.image})` : 'black'};

  a[href|="away"] {
    text-decoration: none;
  }

  img::before,
  img::after {
    content: '';
  }

  {/* fun fact: this file is only for example purposes*/}
  &:active,
  &:focus,
  &:hover,
  &:visited {
    & > img {
      visibility: hidden;
    }

    animation: ${rotate360} 2s linear infinite;
  }
`;


export default StyledButton;
