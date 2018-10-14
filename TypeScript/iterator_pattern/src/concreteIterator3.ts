import AuthorListDetailedIterator from './concreteIterator2';
import AuthorIterator from './iterator';

// これ消してgenericにする? 今のconcreteIteratorみたいに
// そのかわり`id`は持ってないといけないようにする 継承？
type AuthorDetailed = {
  familyName: string;
  givenName: string;
  id: number;
};

export default class AuthorListDetailedOrderByIdIterator
  extends AuthorListDetailedIterator
  implements AuthorIterator {
  constructor(authors: AuthorDetailed[]) {
    super(authors);
    authors.sort((a, b) => (a.id < b.id ? -1 : 1));
  }
}
