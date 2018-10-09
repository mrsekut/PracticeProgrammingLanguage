// practice iterator pattern
// https://liginc.co.jp/web/programming/php/146455

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

for (const name of nameList) {
  console.log(name.familyName, name.givenName, name.id);
}

// =====================
// interfaces
// =====================

interface AuthorList {
  createIterator: () => void;
}

interface AuthorIterator {
  hasNext: () => any; // TODO: type
  next: () => any;
}

// =====================
// Iterator
// =====================

class AuthorListSimpleIterator implements AuthorIterator {
  private authors;
  private position = 0;

  constructor(authors) {
    this.authors = authors;
  }

  public hasNext = () => {
    return;
  };

  public next = () => {
    return this.authors[this.position++];
  };
}

class AuthorListDetailedInterator implements AuthorIterator {
  protected authors; // ?
  private position = 0;

  constructor(authors) {
    this.authors = authors;
  }

  public hasNext = () => {
    // public?
    return;
  };

  public next = () => {
    const author = this.authors[this.position++];
    const familyName = author.familyName;
    const givenName = author.givenName;

    return 'hello';
  };
}

// class AuthorListDetailedOrderByIdIterator extends AuthorListDetailedInterator implements AuthorList {

// }

// trait
class AuthorListMethods {
  private authorList;
  constructor(authors) {
    this.authorList = authors;
  }

  public addToList = author => {
    this.authorList = author;
  };

  public getAuthorList = () => {
    return this.authorList;
  };
}
