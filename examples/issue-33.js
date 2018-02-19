import styled from 'styled-components';

function getPadding() {
  return '1rem';
}

const Div = styled.div.attrs({
  padding: '1rem',
})`
  margin: 0;
  padding: ${(props) => props.padding};
`;

const P = styled.p.attrs({
  padding: getPadding(),
})`
  margin: 0;
  padding: ${(props) => props.padding};
`;
