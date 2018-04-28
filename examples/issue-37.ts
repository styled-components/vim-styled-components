import * as React from 'react';

import styled from '@src/lib/styled-components';

interface CardProps {
  big: boolean;
}

// This has seemingly correct indenting, but no syntax highlighting.
export const Card = styled<CardProps, `div`>('div')`
  background-color: ${props => props.theme.cardBackgroundColor};
  border-radius: ${props => props.theme.baseBorderRadius};
  padding: ${props => props.big ?
                      props.theme.largeMargin : props.theme.normalMargin};
`;

// This has correct syntax highlighting, but indenting is incorrect
// (for example, when in insert mode, opening a new line puts cursor at
// column 0 instead of column 3.)
export const SomeOtherThing = styled.p`
  background-color: red;
`;

// Same as above example (correct highlighting, incorrect indenting)
const linkStyles = css`
  font-weight: bold;
  color: ${props => props.theme.linkColor};
  text-decoration: underline;

  &:hover {
    cursor: pointer;
  }
`;
