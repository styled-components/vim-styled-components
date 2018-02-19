import styled, { css } from 'styled-components';
import { Input as RebassInput } from 'rebass';
import { hexToRgba } from '@/styles/utils/color';

const Input = styled(({ primary, outline, ...restProps }) => (
  <RebassInput {...restProps} />
))`${props => css`
  background-color: #fff;
  color: ${props.theme.colors.lightText};
  padding: 0.5rem 0.75rem;
  border: 1px solid ${hexToRgba(props.theme.colors.lightText, 0.5)};
  border-radius: 3px;
  font-size: 0.875rem;
  font-weight: 500;

  ${props.primary && css`
    background-color: ${props.theme.colors.primary};
    color: ${props.theme.colors.white[0]};
    border: 0;
  `}

  // works best when prepended with css``
  // see line 16
  ${props.outline && `
    background-color: ${props.theme.colors.white[0]};
    color: ${props.theme.colors.primary};
  `}
`};`

Input.defaultProps = {};

export default Input;
