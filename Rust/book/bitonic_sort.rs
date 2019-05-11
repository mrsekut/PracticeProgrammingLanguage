// mod tests {
//     struct Student {
//         first_name: String,
//         last_name: String,
//         age: u8,
//     }

//     impl Student {
//         fn new(first_name: &str, last_name: &str, age: u8) -> Self {
//             Self {
//                 first_name: first_name.to_string(),
//                 last_name: last_name.to_string(),
//                 age,
//             }
//         }
//     }

//     use super::{is_power_of_two, sort, sort_by};
//     use crate::SortOrder::*;

//     #[test]
//     fn sort_students_by_age_ascending() {
//         let taro = Student::new("Taro", "Yamada", 16);
//         let hanako = Student::new("Hanako", "Yamada", 14);
//         let kyoko = Student::new("Kyoko", "Ito", 15);
//         let ryosuke = Student::new("Ryosuke", "Hayashi", 17);

//         let mut x = vec![&taro, &hanako, &kyoko, &ryosuke];
//         let expected = vec![&hanako, &kyoko, &taro, &ryosuke];

//         assert_eq!(
//             sort_by(&mut x, &|a, b| a.age.cmp(&b.age)),
//             Ok(())
//         );

//         assert_eq!(x, expected);
//     }

// }

use rand::{Rng, SeedableRng};
use rand::distributions::Standard;
use rand_pcg::Pcg64Mcg;

fn new_u32_vec(n: usize) -> Vec<u32> {
    let mut rng = Pcg64Mcg::from_seed([0; 16]);
    rng.sample_iter(&Standard).take(n).collect()
}

fn is_sorted_ascending<T: Ord>(x: &[T]) -> bool {
    x.windows(2).all(|pair| pair[0] <= pair[1])
}

fn is_sorted_descending<T: Ord>(x: &[T]) -> bool {
    x.windows(2).all(|pair| pair[0] >= pair[1])
}





enum SortOrder {
    Ascending,
    Descending,
}

fn do_sort<T: Ord>(x: &mut [T], up: bool) {
    if x.len() > 1 {
        let mid_point = x.len() / 2;
        do_sort(&mut x[..mid_point], true);
        do_sort(&mut x[mid_point..], false);
        sub_sort(x, up);
    }
}

fn sort<T: Ord>(x: &mut [T], order: &SortOrder ) -> Result<(), String> {
    if x.len().is_power_of_two() {
        match *order {
            SortOrder::Ascending => do_sort(x, true),
            SortOrder::Descending => do_sort(x, false),
        };
        Ok(())
    } else {
        Err(format!("The length of x is not a power of two. (x.len(): {})", x.len()))
    }
}

fn sub_sort<T: Ord>(x: &mut [T], up: bool) {
    if x.len() > 1 {
        comare_and_swap(x, up);
        let mid_point = x.len() /2;
        sub_sort(&mut x[..mid_point], up);
        sub_sort(&mut x[mid_point..], up);
    }
}

fn comare_and_swap<T: Ord>(x: &mut [T], up: bool) {
    let mid_point = x.len() / 2;
    for i in 0..mid_point {
        if (x[i] > x[mid_point + i]) == up {
            x.swap(i, mid_point + i);
        }
    }
}

fn main() {
    unimplemented!();
}

#[cfg(test)]
mod tests{
    use super::sort;
    use crate::SortOrder::*;
    use super::{ new_u32_vec, is_sorted_ascending, is_sorted_descending };


    #[test]
    fn sort_u32_ascending() {
        let mut x = vec![10, 30, 11, 20, 4, 330, 21, 110];
        assert_eq!(sort(&mut x, &Ascending), Ok(()));
        assert_eq!(x, vec![4, 10, 11, 20, 21, 30, 110, 330]);
    }

    #[test]
    fn sort_u32_descending() {
        let mut x: Vec<u32> = vec![10, 30, 11, 20, 4, 330, 21, 110];
        assert_eq!(sort(&mut x, &Descending), Ok(()));
        assert_eq!(x, vec![330, 110, 30, 21, 20, 11, 10, 4]);
    }

    #[test]
    fn sort_str_ascending() {
        let mut x = vec!["Rust", "is", "fast", "and", "memory-efficient", "with", "no", "GC"];
        assert_eq!(sort(&mut x, &Ascending), Ok(()));
        assert_eq!(x, vec!["GC", "Rust", "and", "fast", "is", "memory-efficient", "no", "with"]);
    }

    #[test]
    fn sort_str_descending() {
        let mut x = vec!["Rust", "is", "fast", "and", "memory-efficient", "with", "no", "GC"];
        assert_eq!(sort(&mut x, &Descending), Ok(()));
        assert_eq!(x, vec!["with", "no", "memory-efficient", "is", "fast", "and", "Rust", "GC"]);
    }

    #[test]
    fn sort_to_fail() {
        let mut x = vec![10, 30, 11];
        assert!(sort(&mut x, &Ascending).is_err());
    }

    #[test]
    fn sort_u32_large() {
        {
            let mut x = new_u32_vec(65536);
            assert_eq!(sort(&mut x, &Ascending), Ok(()));
            assert!(is_sorted_ascending(&x));
        }
        {
            let mut x = new_u32_vec(65536);
            assert_eq!(sort(&mut x, &Descending), Ok(()) );
            assert!(is_sorted_descending(&x));
        }
    }

}