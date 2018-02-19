import React from 'react';
import styled from 'styled-components';


const Button = styled.button`
  background-color: blue;

  padding: 0;

  & > img {
    text-decoration: none;
  }

  img::before,
  img::after {
    content: '';
  }

  &:active,
  &:focus,
  &:hover,
  &:visited {
    & > img {
      visibility: hidden;
    }
  }
`;


class Test extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      arr: [
        1,
        2,
        3,
        4,
      ],
      test: {
        test: {
          test: {
            test: {
            }
          }
        }
      }
    }
  }

  render() {
    return (
      <div>
        <p>
          <Button />
        </p>
      </div>
    );
  }
}
