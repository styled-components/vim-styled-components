import React from "react";
import PropTypes from "prop-types";
import styled, { css } from "styled-components";

import dropDownImg from "assets/images/arrow-down.svg";
import dropDownImgOpen from "assets/images/arrow-up.svg";

const NavItem = styled.div`
  color: #fff;
  padding: 1.2em;
  background-color: ${({ selected, theme }) =>
    selected ? theme.colors.transparentDarkBlue : "transparent"};

  ${({ hasChildren, dropdown }) => hasChildren && css`
    padding-right: ${arrowWidth + 0.75}em;

    &::after {
      background-image: url(${dropdown === "open"
        ? dropDownImgOpen
        : dropDownImg});
      background-position: center center;
      background-repeat: no-repeat;
      background-size: 90%;
      right: 0.5em;
      bottom: 0;
      width: ${arrowWidth}em;
    }
  `};
`;

export default NavItem;
