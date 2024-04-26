export class OrdinalToCardinal {
  public static convertWordToNumber(ordinalWord: string): number {
    switch (ordinalWord) {
      case null:
      case undefined:
      case '':
      case 'first':
        return 1;

      case 'second':
        return 2;
      case 'third':
        return 3;
      case 'fourth':
        return 4;
      case 'fifth':
        return 5;
      case 'sixth':
        return 6;
      case 'seventh':
        return 7;
      case 'eighth':
        return 8;
      case 'ninth':
        return 9;
      case 'tenth':
        return 10;
      case 'eleventh':
        return 11;
      case 'twelfth':
        return 12;
      case 'thirteenth':
        return 13;
      case 'fourteenth':
        return 14;
      case 'fifteenth':
        return 15;
      case 'sixteenth':
        return 16;
      case 'seventeenth':
        return 17;
      case 'eighteenth':
        return 18;
      case 'nineteenth':
        return 19;
      case 'twentieth':
        return 20;

      default:
        throw new Error('Cannot convert "' + ordinalWord + '" -- ' + 'numbers beyond 20 are not currently supported');
    }
  }
}
