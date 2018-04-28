const StyledButton = styled.button`
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

  // TODO: move next element into group
  position: absolute;

  {/* background group */}
  background: none;
  background: url(images/test.jpg);
  background-attachment: initial;
  background-clip: inherit;
  background-color: papayawhip;
  background-image: ${props => props.image ? css`url(${props.image})` : 'initial'};
  background-origin: ${props => props.background_origin};
  background-position: bottom top center left right;
  background-repeat: no-repeat;
  background-size: cover;

  {/* color group */}
  color: white;
  color: papayawhip;
  color: hotpink;
  color: rgba(15, 15, 200, 0.5);
  color: hsla(20, 25, 50, 0.5);

  {/* item alignments */}
  justify-content: space-between;
  align-items: flex-end;

  {/* misc special cases */}
  transition: background-color 2kHz;
  transform: translate3d(120deg);
  top: -15px !important;
  ${props => props.isHighlight ? css`border: 1px solid red;` : ''}

  a[href|="away"] {}

  img::before,
  img::after {}

  .class-def {}
  #identifier-def {}

  {/* fun fact: this file is only for example purposes */}
  &:active,
  &:focus,
  &:hover,
  &:visited {
    & > img {}

    &::before,
    &::after {}

    animation: ${rotate360} 2s linear infinite;
  }

  {/* there are actually no vendor-prefixes necessary for styled-components */}
  -webkit-padding: inherit;
     -moz-padding: inherit;
       -o-padding: inherit;
      -ms-padding: inherit;

  {/* css error */}
  {@<>

  {/* nesting */}
  main {
    article {
      section {
        padding: 15em;
      }
    }
  }

  {/* include keywords */}
  @media only screen and (min-width: 768cm) {}
  @page {}
`;
