import Book from './book';
import AuthorSimple from './conreteAggregate';
import AuthorListSimpleIterator from './concreteIterator';

type Author = string;

// const authorsSimpleList: Author[] = [
const authorsSimpleList = [
  'Kishi Yusuke',
  'Inui Kurumi',
  'Higashino Keigo',
  'Ayatsuji Yukito',
  'Hyakuta Naoki'
];

// const bookA = new Book(new AuthorSimple<Author>(authorsSimpleList));
// bookA.printAuthors();

const bookA = new Book(new AuthorSimple(authorsSimpleList));
bookA.printAuthors();
