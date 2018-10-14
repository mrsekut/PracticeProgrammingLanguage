import Book from './book';
import AuthorSimple from './conreteAggregate';

type Author = string;

const authorsSimpleList: Author[] = [
  'Kishi Yusuke',
  'Inui Kurumi',
  'Higashino Keigo',
  'Ayatsuji Yukito',
  'Hyakuta Naoki'
];

const bookA = new Book(new AuthorSimple<Author>(authorsSimpleList));
bookA.printAuthors();
