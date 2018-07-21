import styled from 'styled-components';

const Schedule = styled.div`
  display: none;
`;

Schedule.Part = styled.div`
  align-items: center;
  display: flex;
`;

const Something = styled(Link)`
  align-items: center;
  display: none;
`;

function test() {
  return styled.div;
}

Schedule.CourseTimes = styled(test())`
  align-items: flex-start;

  img {
    margin-top: 0.3rem;
  }
`;

Schedule.CourseTimes = styled(Schedule.Part)`
  align-items: flex-start;

  img {
    margin-top: 0.3rem;
  }
`;
