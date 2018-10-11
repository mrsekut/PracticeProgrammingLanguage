import Book from './book';
import AuthorSimple from './conreteAggregate';

type AuthorList = string;

const authorsSimpleArray: AuthorList[] = [
  'Matumoto Jun',
  'Kobayashi Kentaro',
  'Mudata Shuichi',
  'Murakami Ryu',
  'Kamijou Touma'
];

const bookA = new Book(new AuthorSimple<AuthorList>(authorsSimpleArray));
bookA.printAuthors();
