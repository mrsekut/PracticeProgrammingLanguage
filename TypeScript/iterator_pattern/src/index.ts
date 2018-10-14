import Book from './book';
import AuthorSimple from './conreteAggregate';
import AuthorListDetailedIterator from './concreteIterator2';
import AuthorListDetailedOrderByIdIterator from './concreteIterator3';

type Author = string;
const authorsSimpleList: Author[] = [
  'Kishi Yusuke',
  'Inui Kurumi',
  'Higashino Keigo',
  'Ayatsuji Yukito',
  'Hyakuta Naoki'
];

type AuthorDetailed = {
  familyName: string;
  givenName: string;
  id: number;
};

const authorsDetailedList: AuthorDetailed[] = [
  {
    familyName: 'Kishi',
    givenName: 'Yusuke',
    id: 5
  },
  {
    familyName: 'Inui',
    givenName: 'Kurumi',
    id: 17
  },
  {
    familyName: 'Higashino',
    givenName: 'Keigo',
    id: 25
  },
  {
    familyName: 'Ayatsuji',
    givenName: 'Yukito',
    id: 1
  },
  {
    familyName: 'Hyakuta',
    givenName: 'Naoki',
    id: 48
  }
];

// const bookA = new Book(new AuthorSimple<Author>(authorsSimpleList));
// bookA.printAuthors();

// const bookB = new AuthorListDetailedIterator(authorsDetailedList);
// console.log(bookB.next());

const bookC = new AuthorListDetailedOrderByIdIterator(authorsDetailedList);
console.log(bookC.next());
console.log(bookC.next());
console.log(bookC.next());
console.log(bookC.next());
