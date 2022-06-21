import { MoveToDecided } from '../../../flows/bails-move-application-to-decided.flow';
import { Given } from 'cucumber';

const moveToDecided = new MoveToDecided();

Given('I move the application to decided', async function () {
  await moveToDecided.moveToDecided(true);
});
