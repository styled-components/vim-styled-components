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
  color: palevioletred;

  {/* border group */}
  border-radius: 30px;
  border-top-left-radius: 1px;
  border-top-right-radius: 2px;
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 4px;
  border-top-width: 1px;
  border-bottom-width: 2px;
  border-right-width: 3px;
  border-left-width: 4px;
  border-top-color: 5px;
  border-bottom-color: 6px;
  border-right-color: 7px;
  border-left-color: 8px;
  border-top-style: 9px;
  border-bottom-style: 10px;
  border-right-style: 11px;
  border-left-style: 12px;

  {/* UI group */}
  box-sizing: content-box;
  box-sizing: padding-box;
  box-sizing: padding;
  box-sizing: border;
  box-sizing: border-box;

  {/* spacing-box group */}
  padding: 15em;
  padding-left: 20px;
  padding-right: 25rem;
  margin: 0;
  margin-left: 20px;
  margin-bottom: 1em;

  position: absolute;

  {/* background group */}
  background: none;
  background-attachment: initial;
  background-clip: inherit;
  background-color: papayawhip;
  background-image: ${props => props.image ? `url(${props.image})` : 'initial'};
  background-origin: ${props => props.background_origin};
  background-position: bottom top center left right;
  background-repeat: no-repeat;
  background-size: cover;

  {/* item alignments */}
  justify-content: space-between;
  align-items: flex-end;

  a[href|="away"] {
    text-decoration: none;
  }

  img::before,
  img::after {
    content: '';
  }

  {/* fun fact: this file is only for example purposes */}
  &:active,
  &:focus,
  &:hover,
  &:visited {
    & > img {
      visibility: hidden;
    }

    &::before,
    &::after {
      background-color: rgba(0, 0, 0, 0.05);
      top: -15px;
      border: none;
      display: block;
    }

    animation: ${rotate360} 2s linear infinite;
  }

  main {
    article {
      section {
        padding: 15em;
      }
    }
  }
`;


// check API of v2
// https://github.com/fleischie/vim-styled-components/issues/16
const Comp = styled.div`color: palevioletred`;
const NewComp1 = Comp.extend`
  color: papayawhip;
`;
const NewComp2 = Comp.extendWith('span')`
  color: lightsalmon;
`;

const Link = styled.a.attrs({
  target: '_blank',
})`
  color: tomato;
`;


export default StyledButton;
