// don't match simple template strings
const genericTemplateString = `
  color: white;
  cursor: pointer;
`;

/* styled-components
 *
 * Note: As glamor and emotion use similar APIs, only the extraneous APIs are
 *       mentioned later on.
 */
import styled, { css, keyframes, injectGlobal, createGlobalStyle } from 'styled-components';

// match of styled.method api
// - unmatched cssTagName (note the double typoes and missing highlighting)
styled.battong`color: tomangtoe`;
// - matched cssTagName
const Button = styled.button`
  background: palevioletred;
  border-radius: 3px;
  border: none;
  color: white;
`;

// match of styled(<string>) api
// - unmatched
unstyled('input')`
  color: white;
`;
// - matched with single quote
styled('input')`
  color: white;
`;
// - matched with double quote
styled("input")`
  color: white;
`;
// - matched with backticks and as jsFuncCall after jsOperator
const Button = styled(`button`)`
  background: palevioletred;
  border-radius: 3px;
  border: none;
  color: white;
`;

// match of styled(<component>) api
// - unmatched
const TomatoButton = unstyled(Button)`
  background: none;
`;
// - matched
const TomatoButton = styled(Button)`
  background: tomato;
`;

// match of styled.*.attrs({}) api
// - unmatched cssTagName (the template string still contains highlighted css)
const Input = styled.inptu.attrs({})`background: none`;
// - matched cssTagName
const Input = styled.input.attrs({
  type: 'text',
  size: props => props.small ? 3 : 8,
})`
  background: palevioletred;
  border-radius: 3px;
  border: none;
  color: white;
  padding: ${props => props.padding};
`;

// match of *.extend api
// - unmatched
const HotpinkButton = Button.extnde`background: none`;
// - matched
const HotpinkButton = Button.extend`
  border-color: tomato;
  color: hotpink;
`;

// match of withComponent
// - unmatched
const HotpinkDvi = HotpinkButton.withComponent('dvi');
// - matched
const HotpinkDiv = HotpinkButton.withComponent('div');

// match of css, keyframes, injectGlobal api
// - css
const complexMixin = css`
  color: ${props => props.whiteColor ? 'white': 'black'};
`;
// - keyframes
const rotate360 = keyframes`
  from {
    transform: rotate(0deg);
  }
  20% {}
  to {
    opacity: 1;
  }
`;
// - injectGlobal
injectGlobal`
  @font-face {
    font-family: 'Operator Mono';
    src: url('../fonts/Operator-Mono.ttf');
  }

  body {
    margin: 0;
  }
`;
// - createGlobalStyle
createGlobalStyle`
  @font-face {
    font-family: 'Operator Mono';
    src: url('../fonts/Operator-Mono.ttf');
  }

  body {
    margin: 0;
  }
`;

// class based stylings
class Container {
  render() {
    const Elem = styled.section`
      position: relative;
      top: 0;
      bottom: 0;
    `;

    const Item = Elem.extend`
      margin: 25px;
    `;

    const List = styled.ul.attrs({
      padding: getPadding(),
    })`
      background-color: blue;
      color: white;
    `;

    return (
      <main>
        <Elem />
        <List>
          <Item />
          <Item />
          <Item />
        </List>
      </main>
    );
  }
}

/* emotion */
import { fontFace } from 'emotion';

// match custom emotion API
// - matched fontFace (similar to css, keyframes & injectGlobal)
fontFace`
  font-family: 'Patrick Hand SC';
  font-style: normal;
  font-weight: 400;
  src: local('Patrick Hand SC');
  unicode-range: U+0100-024F;
`;
// - matched css property on jsx elements
const EmotionDiv = (
  <div test={} />
  <div css={`
    color: blue;
    font-size: ${props.fontSize}px;

    &:hover {
      color: green;
    }

    & .some-class {
      font-size: 20px;
    }
  `}>
    This will be blue until hovered.
    <div className="some-class">
      This font size will be 20px.
    </div>
  </div>
);


/* diet-cola */
import dc from 'diet-cola';

// match diet-cola API
// - unmatched
const Button = cd('button')(`color: white`);
const Button = dc('button')`color: white`;
// - matched
const Button = dc('button')(`
  font-family: inherit;
  font-size: inherit;
  padding: 8px;
  margin: 0;
  color: white;
  background-color: tomato;
  border: 0;
  border-radius: 4px;
  appearance: none;

  color: ${props => (props.a + props.b)};

  &:hover {
    background-color: black;
  }
`);
