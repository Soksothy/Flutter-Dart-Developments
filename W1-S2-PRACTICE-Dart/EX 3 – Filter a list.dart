void main (List<String> arg){
 List<int> score = [45, 78, 62, 49, 85, 33, 90, 50];

 List<int> pass_scores = score.where((score) => score >= 50).toList();

 print('${pass_scores.length} is passed');
}