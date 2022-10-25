for (let i = 1; i <= 9; i++) {
    console.log(`${i} 단`);
  for (let j = 1; j <= 9; j++) {
    console.log(`${i} * ${j} = ${i * j}`);
  }
}


for (let i = 2; i <= 100; i*2) {
    console.log(i);
    
}

for (let i = 1; i <= 50; i++) {
  if(i % 2 !== 0){
    continue;
  }
  console.log(i);
  i++
}