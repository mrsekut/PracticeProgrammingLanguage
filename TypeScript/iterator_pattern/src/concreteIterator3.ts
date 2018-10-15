import AuthorListDetailedIterator from './concreteIterator2';
import AuthorIterator from './iterator';
import { AuthorDetailedList } from './index.d';

export default class AuthorListDetailedOrderByIdIterator
  extends AuthorListDetailedIterator
  implements AuthorIterator {
  constructor(authors: AuthorDetailedList[]) {
    super(authors);
    authors.sort((a, b) => (a.id < b.id ? -1 : 1));
  }
}
