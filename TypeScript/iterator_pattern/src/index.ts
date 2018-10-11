import Book from './book';
import AuthorSimple from './conreteAggregate';
// ===========================
// Main
// ===========================

interface NameList {
  familyName: string;
  givenName: string;
  id: number;
}

const nameList: NameList[] = [
  {
    familyName: 'Maru',
    givenName: 'Kota',
    id: 5
  },
  {
    familyName: 'Naka',
    givenName: 'Takuya',
    id: 11
  },
  {
    familyName: 'Fuka',
    givenName: 'Kazuya',
    id: 9
  },
  {
    familyName: 'Jodiguchi',
    givenName: 'Ayumi',
    id: 7
  }
];

const authorsSimpleArray = [
  'Matumoto Jun',
  'Kobayashi Kentaro',
  'Mudata Shuichi',
  'Murakami Ryu',
  'Kamijou Touma'
];

const bookA = new Book(new AuthorSimple(authorsSimpleArray));
bookA.printAuthors();
